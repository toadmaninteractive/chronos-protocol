using Igor.Erlang;
using Igor.Erlang.Model;
using Igor.Erlang.AST;
using Igor;

[CustomAttributes]
public class SingletonGenerator : IErlangGenerator
{
    const string func = @"
-spec {0}() -> {1}.

{0}() -> 
    ?{2}#{3}.{0}.
";

    public static readonly StringAttributeDescriptor SingletonNameAttribute = new StringAttributeDescriptor("singleton.name", IgorAttributeTargets.Record);
    public static readonly StringAttributeDescriptor SingletonFileAttribute = new StringAttributeDescriptor("singleton.file", IgorAttributeTargets.Record);
    public static readonly StringAttributeDescriptor CatalogueFileAttribute = new StringAttributeDescriptor("catalogue.file", IgorAttributeTargets.Module);

    public void Generate(ErlModel model, Module module)
    {
        foreach (var record in module.Records)
        {
            var name = record.Attribute(SingletonNameAttribute);
            if (name != null)
            {
                var file = record.Attribute(SingletonFileAttribute, module.erlFileName);
                var erl = model.Module(file);
                erl.Include(module.hrlFileName);
                var catalogue = module.attributes.Attribute(CatalogueFileAttribute, module.erlFileName);
                erl.Define(name, string.Format("({0}:{1}({2}))", catalogue, record.erlName, name));
                foreach (var field in record.Fields)
                    if (!field.IsTag && field.Name != "id")
                    {
                        erl.Export(field.erlName, 0);
                        erl.Function(string.Format(func, field.erlName, field.erlType, name, record.erlName));
                    }
            }
        }
    }
}