Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC132BF3CA
	for <loongarch@lists.linux.dev>; Tue,  2 Dec 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764696900; cv=none; b=Fw1YxnggAaCxCc8KOL7FfAsfwuq0oH+hu9AxmzSKGoz/WN6mdyeGG7V8F99QySQJ/xbhJyIioRWBl8XNLhuaol5259omxMU4vWpmFTPmeeRIOVECBcHEALPyF54cGtJ8Ri7itOLqhzmELRvTnkjIrPfK4BPbRlSobvx4oEjEpbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764696900; c=relaxed/simple;
	bh=nC6UNMpAbeJikqHkCNZ3XU3AGBNNIuEaIvJO+uh8gGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLzUktJT5XcUf4B/by6bD78BZqyT7xrhbB05gg9S8BLIOx6zPT3s99PSuUY01B0KBGWCBptPLTsf6K18Y+hC5QzEMmQxia/ibuOU+7TL0XpsDXe4n1sKJ5YUCFihTRMN6ECPXBN5dZjNavagjrfVNHo+wCklN4TVSznlHlZdq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MTMEGzpA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MTMEGzpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764696897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1q6VCvh0fvJAUYdl0dEiYHPLaemZQ8x5yGo7cBIMHE=;
	b=MTMEGzpA2lswRxYUX6lnlzhHpSkqAVdYsZuztJRaKSU3RTcQdOvq0mDPkDPO/yxkeFMP1M
	gtH73YLCo8UHDEGg6QVpmY3aHm0nX2ge9evPuLtgsS6OGJ7dMi5RTUoOOSW2rXtvPi0lfA
	XW79U/8ig9k2AHtzUrDdiNduP0duz08=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-k_abAhk3PvCIQontt332fQ-1; Tue, 02 Dec 2025 12:34:56 -0500
X-MC-Unique: k_abAhk3PvCIQontt332fQ-1
X-Mimecast-MFC-AGG-ID: k_abAhk3PvCIQontt332fQ_1764696895
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b478551a6so3098405f8f.1
        for <loongarch@lists.linux.dev>; Tue, 02 Dec 2025 09:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764696895; x=1765301695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1q6VCvh0fvJAUYdl0dEiYHPLaemZQ8x5yGo7cBIMHE=;
        b=IPaABGumgNWwHEfSoQK0eViu87YIZcpi68DbAeqn2qxb/x7CS7zCsBNwvHb0yV+VIS
         1lPJajJGmDm7XG9X2OhBwHTP9XtckrHQcqzvlWQpxT4qC6mCriUahyUaSL2KX5ektWA1
         u/yIBJ+mecyh0i9QVOXEx9otoZPYVHs11bD5s9Iwdx1N5jGIeD0D9MehE6pKzbA8E7zy
         oB+VEGsJwSYlvn8je7QlOzS/k45Sc85bk1L2lDpfOmdfm9gsSB11GIuyUauc0E/lLnxM
         QxrtVOFU9irRTRCcynZDc+xVHcTtTF36TvDA8ftlOnwZZmVbQdxZgnz4W2mXX176itJF
         7m0A==
X-Forwarded-Encrypted: i=1; AJvYcCXZmBlP78nmDbb9jz21aIEEkn4m4QCu5n/G3kJ/fI5L7Xb8AJ8QFFarZk/M4p2tEqDlnxcOa9+IK3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMB3aDChJPo1w1R4jA9nYzeiafDdY5efHH5ou2qnRpCecFRm4a
	w/0TB+MxPPpfncAkzAPukycuHLpDwGrqyrQHTSKQCBWlQhcB5VDkjyXRP0Dpd15QIoBW3adfqVv
	Jd5DmN2iq7Ehmyvt/NOuJ3NFt2FzfEfff4UctF7O4AFXBnF7lKvzw5IFho7QV+Gp6O9Lk9W/NKX
	c96fB7wZdftnxxtkDS7dKA1OIEWj82mTaQ1BK8LNgqANXC
X-Gm-Gg: ASbGncv1IPb/hwj/B8E5ifN8wMdbEg70wTzEYQ6NZXsB/3LT8BLWrbY1wQ+8WQdytmI
	hKf8HxlDb8H6gy73RlwY7aw+V4mvwO6Xmj5S3qOgiTLDgDT5MMmVzHFtiC6cGb9YFKLYgvUP2DC
	AQh4IgFVauTicn1fqwnelFhjzST1S17D6BD4m/a4DBRlYA0fwAulTw8AFYhEaxCMIfnP7MNG0dU
	Gh0XmTzDWrsBJtuoYoW5nr7F992trIbzI7HOVBwy0L2U4+hx1kqCR9lD1XrGYEKoplEc48=
X-Received: by 2002:a05:6000:2f81:b0:429:bc68:6c95 with SMTP id ffacd0b85a97d-42cc1d520camr50812843f8f.47.1764696895015;
        Tue, 02 Dec 2025 09:34:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEjjM/4gYFdGngCSraq+eLKLFPw2/LoE8KfxUt7snwDvBtfylPl35Ufw8QDh8qpyVhfKf6YbZVKCmrLOrGVC0=
X-Received: by 2002:a05:6000:2f81:b0:429:bc68:6c95 with SMTP id
 ffacd0b85a97d-42cc1d520camr50812822f8f.47.1764696894629; Tue, 02 Dec 2025
 09:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128094343.621879-1-chenhuacai@loongson.cn>
In-Reply-To: <20251128094343.621879-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Dec 2025 18:34:42 +0100
X-Gm-Features: AWmQ_bkULiasT2nd5uRjNuhm9bdkFlT0rSKN-y6aCluXuFX2bH2jC9z-APxyjjs
Message-ID: <CABgObfZoLisM_+8gkO3rh6aCKEXsOzDLowU-_HQZVDHNpeA00Q@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.19
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CwVJ2KpSKopdIqrrhDfk5wPpK0podi4D4LuXah7UOus_1764696895
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 10:44=E2=80=AFAM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb15=
0d:
>
>   Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.19
>
> for you to fetch changes up to 0f90fa6e2e9d98349492d9968c11ceaf2f958c98:
>
>   KVM: LoongArch: selftests: Add time counter test case (2025-11-28 14:49=
:48 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.19
>
> 1. Get VM PMU capability from HW GCFG register.
> 2. Add AVEC basic support.
> 3. Use 64-bit register definition for EIOINTC.
> 4. Add KVM timer test cases for tools/selftests.
>
> ----------------------------------------------------------------
> Bibo Mao (8):
>       LoongArch: KVM: Get VM PMU capability from HW GCFG register
>       LoongArch: KVM: Use 64-bit register definition for EIOINTC
>       KVM: LoongArch: selftests: Add system registers save/restore on exc=
eption
>       KVM: LoongArch: selftests: Add basic interfaces
>       KVM: LoongArch: selftests: Add exception handler register interface
>       KVM: LoongArch: selftests: Add timer interrupt test case
>       KVM: LoongArch: selftests: Add SW emulated timer test case
>       KVM: LoongArch: selftests: Add time counter test case
>
> Song Gao (1):
>       LoongArch: KVM: Add AVEC basic support
>
>  arch/loongarch/include/asm/kvm_eiointc.h           |  55 +-----
>  arch/loongarch/include/asm/kvm_host.h              |   8 +
>  arch/loongarch/include/asm/kvm_vcpu.h              |   1 +
>  arch/loongarch/include/asm/loongarch.h             |   2 +
>  arch/loongarch/include/uapi/asm/kvm.h              |   1 +
>  arch/loongarch/kvm/intc/eiointc.c                  |  80 ++++-----
>  arch/loongarch/kvm/interrupt.c                     |  15 +-
>  arch/loongarch/kvm/vcpu.c                          |  19 +-
>  arch/loongarch/kvm/vm.c                            |  40 +++--
>  tools/testing/selftests/kvm/Makefile.kvm           |   1 +
>  .../selftests/kvm/include/loongarch/arch_timer.h   |  85 +++++++++
>  .../selftests/kvm/include/loongarch/processor.h    |  81 ++++++++-
>  .../selftests/kvm/lib/loongarch/exception.S        |   6 +
>  .../selftests/kvm/lib/loongarch/processor.c        |  47 ++++-
>  tools/testing/selftests/kvm/loongarch/arch_timer.c | 200 +++++++++++++++=
++++++
>  15 files changed, 534 insertions(+), 107 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_ti=
mer.h
>  create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>

