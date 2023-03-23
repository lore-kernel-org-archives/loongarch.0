Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF27723C3
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 07:05:30 +0000 (UTC)
X-UUID: f9ad4909f44e4d5c9739ede7511e0f08-20230323
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:ed970b57-4f9e-4cae-95f1-0ed693c640ae,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-4
X-CID-INFO: VERSION:1.1.20,REQID:ed970b57-4f9e-4cae-95f1-0ed693c640ae,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-4
X-CID-META: VersionHash:25b5999,CLOUDID:3f1facf6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230322180247TBWX6R8M,BulkQuantity:5,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: f9ad4909f44e4d5c9739ede7511e0f08-20230323
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 549283152; Thu, 23 Mar 2023 15:05:21 +0800
Message-ID: <ada9e89a70c6435cc7a832718a7b9b0f10d56fdd.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Enze Li <lienze@kylinos.cn>
To: Xi Ruoyao <xry111@xry111.site>, chenhuacai@kernel.org, kernel@xen0n.name
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Thu, 23 Mar 2023 15:05:20 +0800
In-Reply-To: <3421f5632586b932bd05df1021290ed7def2fe18.camel@xry111.site>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <3421f5632586b932bd05df1021290ed7def2fe18.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Ruoyao,

It's very kind of you to have this review.  :)

Please see below.

On Wed, 2023-03-22 at 18:02 +0800, Xi Ruoyao wrote:
> On Wed, 2023-03-22 at 17:05 +0800, Enze Li wrote:
> > When I use the latest version of lscpu to check my CPU info, I see,
> > 
> > ======
> > Architecture:          loongarch64
> >   Byte Order:          Little Endian
> > CPU(s):                4
> >   On-line CPU(s) list: 0-3
> > Model name:            -
> >   Thread(s) per core:  1
> >   Core(s) per socket:  4
> > ...
> > ======
> > 
> > Obviously, the "Model name" field shows me with a "-", which means
> > the
> > lscpu failed to retrieve the correct information from the
> > /proc/cpuinfo
> > file.
> > 
> > The main problem is that, the lscpu only identifies the data by its
> > "model name" field.  However, on the LoongArch platform, only
> > 'Model
> > Name' is provided, which cannot be accurately identified due to
> > case
> > sensitivity issues.  And I think that must be an oversight.
> 
> If I read lscpu code correctly, it also matches "cpu MHz" (instead of
> "CPU MHz"), "address sizes" (instead of "Address Sizes"), "features"
> (instead of "Features"), "cpu family" (instead of "CPU Family"), and
> "CPU revision" (instead of "CPU Revision").  Maybe you want to "fix"
> them as well.

I didn't notice the "issues" you mentioned, so it remains to be seen if
they are "real" problems.  However, I think changes like this should be
approached with caution, and we should refer to the official Loongson
website's distribution versions[1] (which are widely used) for
guidance.

> 
> But this is just strange: both "CPU" and "MHz" are some sort of
> abbreviations ("Central Process Unit" and "Mega Hertz") so why "cpu"
> should be lower case but "MHz" should not?  And why "CPU revision"
> but
> "cpu MHz"?
> 
> To me it's a util-linux bug.  Can you report it at
> https://github.com/util-linux/util-linux/issues and let's wait for
> the
> response from util-linux maintainers?

Also, I'd like to know why the LoongArch architecture is different from
other architectures on this issue?  If this is a bug, then all existing
software that uses the 'model name' field will have this bug for
LoongArch.  This will require all maintainers to adapt to LoongArch (by
adjusting it to be case-insensitive), which will unnecessarily increase
the difficulty of adapting to LoongArch, won't it?

Best Regards,
Enze

> 
> > This patch fixes this issue.  With this patch applied, I get,
> > 
> > ======
> > Architecture:          loongarch64
> >   Byte Order:          Little Endian
> > CPU(s):                4
> >   On-line CPU(s) list: 0-3
> > Model name:            Loongson-3A5000-HV
> >   Thread(s) per core:  1
> >   Core(s) per socket:  4
> > ...
> > ======
> > 
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >  arch/loongarch/kernel/proc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/loongarch/kernel/proc.c
> > b/arch/loongarch/kernel/proc.c
> > index 5c67cc4fd56d..7da56f9ee15c 100644
> > --- a/arch/loongarch/kernel/proc.c
> > +++ b/arch/loongarch/kernel/proc.c
> > @@ -50,7 +50,7 @@ static int show_cpuinfo(struct seq_file *m, void
> > *v)
> >         seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
> >         seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> >         seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
> > -       seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
> > +       seq_printf(m, "model name\t\t: %s\n", __cpu_full_name[n]);
> >         seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
> >         seq_printf(m, "FPU Revision\t\t: 0x%02x\n", fp_version);
> >         seq_printf(m, "CPU MHz\t\t\t: %llu.%02llu\n",
> > 
> > base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece

