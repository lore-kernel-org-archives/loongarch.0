Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3515AA
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1679560328; bh=aHImbr1Y0KsprZQxOTFkikHQm5Xg9i8YFnAluTHIroA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DvhFCmLSn4x2PCu347zxbIIdRiwa87d2fHwhaYQtj/uZQ+PsBq6DXxEuttpvb+3Vy
	 kIK5gikF4GjBOVbbNt9aJ/yzqST33OrQNXm4y/YECm7hbO0KfL6qCqMX9qumdgIEK9
	 +GmCXboMxVWCBEGSlrAC1LnjHcp+m8B4CBCVotXQ=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4005F600AE;
	Thu, 23 Mar 2023 16:32:08 +0800 (CST)
Message-ID: <793a6d0f-fc79-ffd4-856f-9dff6e431352@xen0n.name>
Date: Thu, 23 Mar 2023 16:32:07 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
Content-Language: en-US
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
References: <20230322090533.4079453-1-lienze@kylinos.cn>
 <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
 <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/3/23 14:37, Enze Li wrote:
> Hi Xuerui,
> 
> Thanks for your review!  A few comments inlined below.
> 
> On Wed, 2023-03-22 at 19:09 +0800, WANG Xuerui wrote:
>> On 2023/3/22 17:05, Enze Li wrote:
>>
>> <snip>
>>
>> NAK: it's userspace-visible ABI change. AFAIK there are already
>> multiple
>> downstream adaptations (made by Loongson folks) that rely on the
>> current
>> spelling, which may not have any fallback mechanism built in (e.g.
>> recognize both "Model Name" and "model name", match case-
>> insensitively,
>> etc).
> 
> I can hardly believe that the 'Model Name' has been widely adopted.
> AFAIK, the latest official releases[1][2][3] use 'model name'(*NOT* the
> same with the upstream).  Wouldn't Loongson folks use their own
> distribution for downstream software development?
> 
> It's undeniable that there are still a few developers who develop
> downstream software based on the upstream kernel, but it's only a small
> portion.  AFAIK, there are three pre-release versions that use the
> upstream kernel, namely Archlinux, fedora-remix-loongarch, and Gentoo.
> However, none of them have released an official version, which means
> they are not widely used.

As a matter of fact, Archlinux and Gentoo (and their derivatives) are 
"rolling-release" distros. Which means they *never* release "official 
versions", if you mean things like tagged releases and corresponding LTS 
branches.

And AFAIK users of all three can be seen in the wild, I've definitely 
seen them upstream, maybe you need to look elsewhere than you previously 
used to.

> 
> Considering that the 'Model Name' field only exists in upstream code
> and hasn't been widely adopted so far, I cautiously believe that this
> issue needs to be fixed as soon as possible to avoid disrupting the
> LoongArch ecosystem.
> 
>>
>> It's better to adapt the downstream projects instead, for example
>> you
>> could make them more resilient to a hypothetic future arch's similar
>> change by making them match case-insensitively.
> 
> Yes, I used to think the same way.  But then I found out that almost
> all architectures, except for LoongArch, use the 'model name' field for
> identification.  In this case, if I were a maintainer in the util-linux
> community, I don't think I would approve the change if someone
> submitted a patch like that, because the code would disrupt the overall
> structure and make it less aesthetically pleasing.

Casing is generally considered personal taste, and different people's 
tastes can hugely vary. For example, in contrast to your belief, the 
current spelling is in fact *more* aesthetically pleasing to Huacai: 
compare the initial arch/loongarch port's [v5] and [v6] where the case 
change was introduced.

(I had talked with Huacai about the field keys but the conversation was 
private & in Chinese; I was actually proposing all-lowercase keys but he 
insisted on "mhz" being "incorrect", then as a result he had to Title 
Case everything else because of *aesthetic reasons* which I didn't and 
still don't agree with. I later criticized him because he left 
"processor", "package" and "core" lowercased, but he never gave any 
satisfying justification nor backed out the change, so as a result we 
are left with the current situation. You can say anything, but as a 
matter of fact, the ship has sailed.)

[v5]: 
https://lore.kernel.org/lkml/20211013071117.3097969-3-chenhuacai@loongson.cn/#Z31arch:loongarch:kernel:proc.c
[v6]: 
https://lore.kernel.org/all/20220226110338.77547-17-chenhuacai@loongson.cn/#Z31arch:loongarch:kernel:proc.c

> 
> [1]
> http://pkg.loongnix.cn/loongnix-server/8.4/isos/8.4.0/Loongnix-server-8.4.0.livecd.loongarch64.iso
> [2]
> http://pkg.loongnix.cn/loongnix/isos/Loongnix-20.3/Loongnix-20.3.livecd.mate.loongarch64.iso
> [3]
> http://pkg.loongnix.cn/loongnix/isos/Loongnix-20.3/Loongnix-20.3.sp1.livecd.cartoon.loongarch64.iso

In general we don't recommend caring about the old world. They are 
essentially forks/downstream of the various projects we talk 
about/contribute to, which are stuck to the previous non-"peer-reviewed" 
ABI due to non-technical reasons. (There are multiple possible ways to 
get unstuck but that's unrelated to the current topic.) As the upstream 
has moved on, and considering that much of Loongnix modification has no 
chance being accepted upstream, it's probably better to just maintain 
patches downstream in favor of keeping the boundary of the two clear.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

