Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E71E388E61
	for <loongarch@lists.linux.dev>; Wed,  8 Apr 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636448; cv=none; b=P6Otczv7kEO/4eq1yidqlAHc6YLuAmsK7Dbq8o/6KQ0OzH6+G7ounVEO+wQyJFQhaPoGqz9QAqGjMnm4soa22Ids6dIHfrN3MpaBKGgIhALsazl4w6P3YZedu4z8nc6llaqhGFy4MGjDq5pBraikmfPgq6YEPOEqULu0rF/LBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636448; c=relaxed/simple;
	bh=ChTnGmfzkmJm6JIhHr7ZZIOGMczgkooz7Z3+3rgcCb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxcwcQRQMrkX1KNevos8sGJNCl8TY6kAOfP5Cb4CDlVXQMzD/d9K0Sj64OxhRW1V0UaCuJPgIPoJ9FwYqz21yPfk6DRv3BPwVn09bzA7eANG3iHMAQrC5WR+k0jbXgJOX70nMSWqpb7YiuT6F+rr9WhicMHE2PAAys6XFvl8zYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qvk263Wo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qvk263Wo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FF2C2BCAF
	for <loongarch@lists.linux.dev>; Wed,  8 Apr 2026 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636448;
	bh=ChTnGmfzkmJm6JIhHr7ZZIOGMczgkooz7Z3+3rgcCb0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qvk263WoJmKxGMMkdLi9W5lFWxogVcbNukP/a6xzmib80/+uRQsFmx51oJmGTBREl
	 K2+WiAX8h170bdZPkmaeljD9SHGCr9x+NzwTL0rk/fD8S/b9vP2p+IjoWGOD7J2/Hh
	 u4rws2tWcCJXF4Y9yzfO/vxQR4Z2i4tdFeFnTscdkC359+DljNditn8cskga0BvHAv
	 PyDKsbtvw2L7Q+bKtn3CLpJ6OHaDdsD80noWJR4Ep3OMyb0PLP2MPvJ8Mn8wy/pjfD
	 /N/RyzGmz6CIAxc13B3yZChuAM5+nl6JGzHTfUAy1uyrgINV+8Ah3wuN5/mS5F/oFP
	 RejhILyWSyjTg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so11140462a12.1
        for <loongarch@lists.linux.dev>; Wed, 08 Apr 2026 01:20:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWY12XsfGraMZQaWNkZDNwN+eQu3AKryk1aedDRT5h8wfsyc5Va6qzpagxIL8Y/SYpZtb2QgehA3ww=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLF7V42rLp/Ft34agD486n1pht6DSbPV0mPFkQ14PImSO7qqu5
	JXZ2lY3Ufa4j1LVTwCp43EVSVnWNvT1858gABCqN+0zBu60sX/caZ74YC+nUN70wuZSC7BpWyei
	fnIHUfGfhmRrHfKZBpyXUUkUArlPlDW8=
X-Received: by 2002:a17:907:1903:b0:b95:894b:46e4 with SMTP id
 a640c23a62f3a-b9c679adcccmr1038322066b.34.1775636446551; Wed, 08 Apr 2026
 01:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026032456-crinkle-washable-96ea@gregkh> <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
 <2026032541-rental-sizably-48bd@gregkh> <2026040259-landowner-chamomile-f581@gregkh>
 <60f0307f-0c44-4f14-0185-4f0a16cf3a9c@loongson.cn> <2026040814-console-curvy-fd6f@gregkh>
In-Reply-To: <2026040814-console-curvy-fd6f@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Apr 2026 16:20:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Q1kaTMhJt8CsN2FS1vfkWLpOxuj8hqYaTr1UgLC5LLg@mail.gmail.com>
X-Gm-Features: AQROBzC94hyOMhorYRrx1iQlbWvINrlYPWijz6ALDVDXgZwQJSaPnFH6Ugqj_Ac
Message-ID: <CAAhV-H4Q1kaTMhJt8CsN2FS1vfkWLpOxuj8hqYaTr1UgLC5LLg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch table
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bibo Mao <maobibo@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	arnd@arndb.de, jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all,

On Wed, Apr 8, 2026 at 1:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 08, 2026 at 09:17:07AM +0800, Bibo Mao wrote:
> >
> >
> > On 2026/4/2 =E4=B8=8B=E5=8D=8810:36, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 25, 2026 at 09:53:09AM +0100, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 25, 2026 at 11:26:29AM +0800, Xi Ruoyao wrote:
> > > > > On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
> > > > > > The LoongArch syscall number is directly controlled by userspac=
e, but
> > > > > > does not have a array_index_nospec() boundry to prevent access =
past
> > > > > > the
> > > > > > syscall function pointer tables.
> > > > > >
> > > > > > Cc: Huacai Chen <chenhuacai@kernel.org>
> > > > > > Cc: WANG Xuerui <kernel@xen0n.name>
> > > > > > Assisted-by: gkh_clanker_2000
> > > > > > Cc: stable <stable@kernel.org>
> > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > ---
> > > > > > My scripts caught this as I think LoongArch is vulnerable to th=
e
> > > > >
> > > > > There's no evidence.  The kernel currently report all LoongArch
> > > > > processors invulnerable to spectre V1 via cpuinfo.
> > > >
> > > > Where is that?  In the sysfs files, or in the actual silicon testin=
g?
> > > >
> > > > > So NAK unless there's a reproducer of spectre V1 on LoongArch.  I=
f so
> > > > > we'd also need to adjust the cpuinfo output.
> > > >
> > > > I really thought this cpu was vulnerable to this, but if the compan=
ies
> > > > say it isn't, then great, but reports like this:
> > > >   https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-=
3-of-3/
> > > > say that the silicon is vulnerable.  So, which is it?
> > >
> > > Any thoughts about this?
> > co-ask though it is hard to decide :(
>
> Can't you all run the reproducers on your platform to determine this?
> There should be some basic ones around somewhere, this is a very old bug
> :)
I have consulted with the chip designers. They confirmed that existing
LoongArch processors are vulnerable to Spectre-V1. But this conclusion
is just for the PoC (as [1] said,  Spectre-V1 is not easily mitigated
in hardware), it is very difficult to create a real attack program.
This is not even a LoongArch-specific problem.

As an additional point, LoongArch's boundary-checking memory access
instructions, which provide immunity against Spectre-V1, are not
convenient enough to automatically apply to all critical code
sections.

Anyway, user pointer sanitization is the proper mitigation of
Spectre-V1, and that is exactly what this patch does. So, I will take
this patch and update other corresponding parts of the kernel.

[1] https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of-3=
/

Huacai

>
> thanks,
>
> greg k-h
