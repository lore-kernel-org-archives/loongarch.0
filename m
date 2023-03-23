Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23823A8
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 06:37:20 +0000 (UTC)
X-UUID: 69f6614ebf404d69bd866ce56851de9a-20230323
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:343798be-d0a2-4b09-817b-1e07d9c1b14f,IP:10,
	URL:25,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:26
X-CID-INFO: VERSION:1.1.20,REQID:343798be-d0a2-4b09-817b-1e07d9c1b14f,IP:10,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:26
X-CID-META: VersionHash:25b5999,CLOUDID:359b3c29-564d-42d9-9875-7c868ee415ec,B
	ulkID:230322180247TBWX6R8M,BulkQuantity:3,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 69f6614ebf404d69bd866ce56851de9a-20230323
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1955700903; Thu, 23 Mar 2023 14:37:09 +0800
Message-ID: <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Enze Li <lienze@kylinos.cn>
To: WANG Xuerui <kernel@xen0n.name>, chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Thu, 23 Mar 2023 14:37:08 +0800
In-Reply-To: <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Xuerui,

Thanks for your review!  A few comments inlined below.

On Wed, 2023-03-22 at 19:09 +0800, WANG Xuerui wrote:
> On 2023/3/22 17:05, Enze Li wrote:
> > When I use the latest version of lscpu to check my CPU info, I see,
> > 
> > ======
> > Architecture:          loongarch64
> >    Byte Order:          Little Endian
> > CPU(s):                4
> >    On-line CPU(s) list: 0-3
> > Model name:            -
> >    Thread(s) per core:  1
> >    Core(s) per socket:  4
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
> > 
> > This patch fixes this issue.  With this patch applied, I get,
> > 
> > ======
> > Architecture:          loongarch64
> >    Byte Order:          Little Endian
> > CPU(s):                4
> >    On-line CPU(s) list: 0-3
> > Model name:            Loongson-3A5000-HV
> >    Thread(s) per core:  1
> >    Core(s) per socket:  4
> > ...
> > ======
> > 
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >   arch/loongarch/kernel/proc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/loongarch/kernel/proc.c
> > b/arch/loongarch/kernel/proc.c
> > index 5c67cc4fd56d..7da56f9ee15c 100644
> > --- a/arch/loongarch/kernel/proc.c
> > +++ b/arch/loongarch/kernel/proc.c
> > @@ -50,7 +50,7 @@ static int show_cpuinfo(struct seq_file *m, void
> > *v)
> >   	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
> >   	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> >   	seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
> > -	seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
> > +	seq_printf(m, "model name\t\t: %s\n", __cpu_full_name[n]);
> 
> NAK: it's userspace-visible ABI change. AFAIK there are already
> multiple 
> downstream adaptations (made by Loongson folks) that rely on the
> current 
> spelling, which may not have any fallback mechanism built in (e.g. 
> recognize both "Model Name" and "model name", match case-
> insensitively, 
> etc).

I can hardly believe that the 'Model Name' has been widely adopted.
AFAIK, the latest official releases[1][2][3] use 'model name'(*NOT* the
same with the upstream).  Wouldn't Loongson folks use their own
distribution for downstream software development?

It's undeniable that there are still a few developers who develop
downstream software based on the upstream kernel, but it's only a small
portion.  AFAIK, there are three pre-release versions that use the
upstream kernel, namely Archlinux, fedora-remix-loongarch, and Gentoo.
However, none of them have released an official version, which means
they are not widely used.

Considering that the 'Model Name' field only exists in upstream code
and hasn't been widely adopted so far, I cautiously believe that this
issue needs to be fixed as soon as possible to avoid disrupting the
LoongArch ecosystem.

> 
> It's better to adapt the downstream projects instead, for example
> you 
> could make them more resilient to a hypothetic future arch's similar 
> change by making them match case-insensitively.

Yes, I used to think the same way.  But then I found out that almost
all architectures, except for LoongArch, use the 'model name' field for
identification.  In this case, if I were a maintainer in the util-linux 
community, I don't think I would approve the change if someone
submitted a patch like that, because the code would disrupt the overall
structure and make it less aesthetically pleasing.

[1] 
http://pkg.loongnix.cn/loongnix-server/8.4/isos/8.4.0/Loongnix-server-8.4.0.livecd.loongarch64.iso
[2] 
http://pkg.loongnix.cn/loongnix/isos/Loongnix-20.3/Loongnix-20.3.livecd.mate.loongarch64.iso
[3] 
http://pkg.loongnix.cn/loongnix/isos/Loongnix-20.3/Loongnix-20.3.sp1.livecd.cartoon.loongarch64.iso

Best Regards,
Enze

> 
> >   	seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
> >   	seq_printf(m, "FPU Revision\t\t: 0x%02x\n", fp_version);
> >   	seq_printf(m, "CPU MHz\t\t\t: %llu.%02llu\n",
> > 
> > base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece

