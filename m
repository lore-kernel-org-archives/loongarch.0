Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954628E8
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 08:26:52 +0000 (UTC)
X-UUID: b4a6db3a996b4404b4e6840fa6c91753-20230323
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:d7bc6158-bf4c-4b37-9a7a-4757037edb0a,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.20,REQID:d7bc6158-bf4c-4b37-9a7a-4757037edb0a,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:4ea7aef6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230322180247TBWX6R8M,BulkQuantity:7,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: b4a6db3a996b4404b4e6840fa6c91753-20230323
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1598213134; Thu, 23 Mar 2023 16:16:04 +0800
Message-ID: <ff0de60d60185dc45ca1f03430969f51353feca3.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Enze Li <lienze@kylinos.cn>
To: Xi Ruoyao <xry111@xry111.site>, chenhuacai@kernel.org, kernel@xen0n.name
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Thu, 23 Mar 2023 16:16:02 +0800
In-Reply-To: <02360140686b6cc74ea5b48207b639fd64a29365.camel@xry111.site>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <3421f5632586b932bd05df1021290ed7def2fe18.camel@xry111.site>
	 <ada9e89a70c6435cc7a832718a7b9b0f10d56fdd.camel@kylinos.cn>
	 <02360140686b6cc74ea5b48207b639fd64a29365.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2023-03-23 at 16:04 +0800, Xi Ruoyao wrote:
> On Thu, 2023-03-23 at 15:05 +0800, Enze Li wrote:
> 
> > > If I read lscpu code correctly, it also matches "cpu MHz"
> > > (instead of
> > > "CPU MHz"), "address sizes" (instead of "Address Sizes"),
> > > "features"
> > > (instead of "Features"), "cpu family" (instead of "CPU Family"),
> > > and
> > > "CPU revision" (instead of "CPU Revision").  Maybe you want to
> > > "fix"
> > > them as well.
> > 
> > I didn't notice the "issues" you mentioned, so it remains to be
> > seen if
> > they are "real" problems.  However, I think changes like this
> > should be
> > approached with caution, and we should refer to the official
> > Loongson
> > website's distribution versions[1] (which are widely used) for
> > guidance.
> 
> Not found the link to 1.  And again we should not refer to the
> "official" Loongson distributions for kernel development, at all,
> because the commercial distributions are *fundamentally* incompatible
> with the upstream kernel.
> 
> > > But this is just strange: both "CPU" and "MHz" are some sort of
> > > abbreviations ("Central Process Unit" and "Mega Hertz") so why
> > > "cpu"
> > > should be lower case but "MHz" should not?  And why "CPU
> > > revision"
> > > but
> > > "cpu MHz"?
> > > 
> > > To me it's a util-linux bug.  Can you report it at
> > > https://github.com/util-linux/util-linux/issues and let's wait
> > > for
> > > the
> > > response from util-linux maintainers?
> > 
> > Also, I'd like to know why the LoongArch architecture is different
> > from
> > other architectures on this issue?  If this is a bug, then all
> > existing
> > software that uses the 'model name' field will have this bug for
> > LoongArch.
> 
> Only arch/x86, arch/ia64, arch/arm, and arch/x86_64 provides a "model
> name" field in cpuinfo.  arch/ppc and arch/sparc use "cpu" field
> instead
> of "model name" and lscpu accepts it.
> 
> If some code only matches "model name" and it blows up when the
> matching
> fails, it's definitely a bug because the code is already broken on 19
> Linux ports out of 23.  It's 19 out of 23, or 82%, not loongarch
> alone
> out of 23.
> 
> > This will require all maintainers to adapt to LoongArch (by
> > adjusting it to be case-insensitive), which will unnecessarily
> > increase
> > the difficulty of adapting to LoongArch, won't it?
> 
> Yes, on the day "Model Name" was written, it was an unnecessary
> difficulty and we made an error.  But once arch/loongarch is released
> in
> 5.19, it becomes a necessary difficulty.  If we just change it now,
> it
> will be another error.
> 
> It's just like we all know implicit fall-thorough in switch-case
> statements is a design error, but we cannot just change the compiler
> to
> silently add a "break" before all "case".
> 

Got you!  Thanks a lot for your explanation and patience.

I'll keep an eye on this architecture to see if there's any help I can
do.

Thanks,
Enze


