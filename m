Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8594F29B795
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692788; cv=none; b=S1E+OyN+IZotIfImHdoSi0YS+Iy5fkUyKVEr/ss5EhhqS3nJ9IMN5rPCIBQvvNSHP1+t+o3qvUX6lJlf+FIENPTQMMmvzqtZM/Blk/1Vu/daPMzkW+vfyLpHTir3LNlRkcgQi19gqupvftEg0eZSMAPuP8Z2Tprjs24ObLPfQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692788; c=relaxed/simple;
	bh=s8cNsSVhZ3RkAm+jDzdvUksN+1x34ABKzCpBDjk3rHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+pTDkX8D37TzkzYpVETNJu3vDbBgNM5CdCwTmtgOH8KUyIinMEO2LBXHgC/9+PdBHLeRtv3qkKYS13kpOm1ECuJZ7KMFblf95Elve8GETQK0a7imMeCkWdkTEdQ3jhcZCj53dgKd+75fQZMzO+HXsUDaapuGaPt4K76MWHfVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNva9iHv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNva9iHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199961F000E9
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692787;
	bh=ZHdWJB2BiyxmhREK7giZIXjhCTkA1O03lnMMdRJ9eRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YNva9iHvkOPHIkRRCqb1ovPNv6AtInyxJdmgqlUaz+6H91RohX7g5hbn0z6NKpQyQ
	 WM1GQp7aaMaffEyzxb+9GIpa3ofTrGTCGkpFQNiHZYhFGnSHG8PyPXLxpUBDTWciXa
	 3/GNAJJcsV7Iw5HlhOYQo977KTmIx6rYZHKsZVFzkhr0JCHdtMsocJYDsJ1VBc05sj
	 NLOGC4uWV+YzfXiXRNHT/pjUOnlUUdoeazw9gIcOYvEZ/yIZJR0r+PK90hgeDckvHE
	 gcmcBJLbHpzBrECpherUqayrzV1U9FS7pVQAdKDFFR50iR39bHKoEGLCY2khs3OuP6
	 FuIeg8tBPDBWA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso1810781a12.3
        for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 07:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqaApuZnAtUtcIdfmMpF56CzSWHN9J+IgUnKKFFG/QkiTfxdtI4Hv7Daw/PTL1F9FrY2PCK+Ei1htY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjf0cVatFRY001xAYIYCL8i1Y6EPMhkn5pGXr8P2PCJmnfFfdh
	BjcQVnCZZOhpinLXj5g+ovCfL0K35ptP/Iu/ipiXBN75AWagw1Laqyp8k2yh2XS2XdISj9eFvG3
	l+frVRBYaLbFsGBXiIF850F8dKlbWzM4=
X-Received: by 2002:a05:6402:194e:b0:698:bbe:9c8 with SMTP id
 4fb4d7f45d1cf-69ab4469aa3mr5016750a12.15.1783692785766; Fri, 10 Jul 2026
 07:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAhV-H7S9_hPDFoCtzgfY9TeH_koN9NfKq9mo8y9BmLA5-7how@mail.gmail.com>
 <20260709124830.15417-1-dongtai.guo@linux.dev>
In-Reply-To: <20260709124830.15417-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Jul 2026 22:12:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H48MWTkJuqOV3M1wFhZXL5U7Kp0Vegv74P4t6XEvOEpHA@mail.gmail.com>
X-Gm-Features: AUfX_mwEQbfiRwKJSjmg9Z9gLLMMYvWBHmoip68TanGdrsXRUZEOoiUPd_-0Iac
Message-ID: <CAAhV-H48MWTkJuqOV3M1wFhZXL5U7Kp0Vegv74P4t6XEvOEpHA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] LoongArch: kexec: avoid clobbering the QEMU FDT
To: George Guo <dongtai.guo@linux.dev>
Cc: maobibo@loongson.cn, loongarch@lists.linux.dev, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 8:48=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> Hi Huacai,
>
> Thanks for the correction, and I am sorry for the way I handled this.
>
> > Who told you the trampoline is dead code? All non-boot CPUs are
> > running in the trampoline, you can use maxcpus=3D1 to go to the new
> > kernel, and do something, and then hotplug the non-boot CPUs at any
> > time.
>
> You are right, and I was wrong to call the trampoline dead once the new
> kernel starts.  The non-boot CPUs spin in kexec_smp_wait inside the
> trampoline buffer and only leave it when the new kernel brings them
> online, so with maxcpus=3D1 they stay there until a later CPU hotplug.
> The buffer has to stay valid the whole time.
>
> That breaks my patch 1.  control_code_page is allocated by the kexec
> core and is not reserved in the new kernel, so the new kernel can reuse
> that page while the non-boot CPUs are still spinning in it, and small
> memory makes that more likely.  The fixed KEXEC_CONTROL_CODE at 0x100000
> avoided this because the first 2MB is memblock_reserve()d in both
> kernels; its only problem was that it overlaps QEMU's machine FDT at
> 0x100000.  So my Q2 answer in the cover letter was also wrong, and "as
> arm64/riscv do" does not apply here.
>
> So the trampoline still needs to live in the cross-kexec reserved first
> 2MB, just not on top of the FDT.  The FDT declares fdt_totalsize 1MB and
> covers [0x100000, 0x200000), so the room left is below 0x100000.
>
> Do you have a different fix in mind? I would like to agree on the
> direction with you before I send anything.
>
> > BTW,  you have never replied to my comments, all you have done is
> > submit new versions again and again.
>
> That is fair, and it was my mistake.  I should have replied to your
> review in the thread and discussed it before sending a new version,
> instead of putting my answers in a cover letter.  I will reply to
> comments first from now on.
>
> I will hold the series until we settle the trampoline approach.
I had proposed a reasonable solution as early as in v1.

Huacai

>
> Thanks,
> George
