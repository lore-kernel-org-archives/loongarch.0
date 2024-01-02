Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB9156D9
	for <loongarch@lists.linux.dev>; Tue,  2 Jan 2024 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoAxLPzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704219500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qqNcOVDP8DdJ819qPbE88DE6/hMQSOntgNZh+qc4qEc=;
	b=CoAxLPzBvta5LHqQkgxrh6X2JiaacchVs2uNpOvfbiy1ZpMz+ar+xjXqyOzVLbi4o0vSh1
	Ha3v7T+4YrYlguSg+/UVWueGQz1aWuPZZDu6THC1w9sjTsy0DnoddvWcOdhukEdEKVUeVb
	LmcKKoG/sQXmlPKBcvjUpzbalgCFDJc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-8QRvY42PMG-kCenDLYnNOQ-1; Tue, 02 Jan 2024 13:18:18 -0500
X-MC-Unique: 8QRvY42PMG-kCenDLYnNOQ-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-466ec6d33bcso1833055137.3
        for <loongarch@lists.linux.dev>; Tue, 02 Jan 2024 10:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704219498; x=1704824298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqNcOVDP8DdJ819qPbE88DE6/hMQSOntgNZh+qc4qEc=;
        b=rrkc2grd9hqF54wG3mXfyX1Z7l5Feh9b9FFFPY3y4UgrkSkD8lakwFy8FIdMj9YJSW
         1+dgDi9BDhPPsElmplM6vhbhItIWw57e3dk3ymlxK4HW7ffY68aC+LYLwijMssFlHcx/
         EEXp1PIr8FVkImq2BN5bdGVk/JAnsUXDCFc3PYCJn/5Sm9PjFoiF2sqVq4C5pibWry2B
         GXNTrqVvRVPs4mmBiZAPPdwbdmgKEs47nGN8Ce/MPlt1r1dQ6Um5qN/EptMZgUSOOUrL
         AZQ4jMURRaAQJ4NSFpocjy7esZaFbs/P9AwKgA3Id6n0PV4blQvCsALWHGKb1ZZ+CbuH
         WRWw==
X-Gm-Message-State: AOJu0YzG3X5EWYBJYSB1gjHYT6qurwLZWOrBT2RmnkyYC4PFPzYD/p/E
	oTghFAmvbPrp+5D/7f1f/s2cmBGkNYiqYFt4Ydb055nZKOIauQ15F2r8SL+67Cw6HVe44ibwmv5
	9ZsNEw/1UczczsyLPVmaCDIOQLKW0Caz69xiVx4Q0GSuU
X-Received: by 2002:a05:6102:32cb:b0:467:7df1:93d4 with SMTP id o11-20020a05610232cb00b004677df193d4mr1333695vss.56.1704219497995;
        Tue, 02 Jan 2024 10:18:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVztsrJFmMF0JJjeSQuEPrOTAsB2AewM3tqW1FHbMEMG3rKdHdoK3NErEji+Bu7ltEHjnjBgbxoSTivL4kKWw=
X-Received: by 2002:a05:6102:32cb:b0:467:7df1:93d4 with SMTP id
 o11-20020a05610232cb00b004677df193d4mr1333683vss.56.1704219497723; Tue, 02
 Jan 2024 10:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231223120642.1067728-1-chenhuacai@loongson.cn>
In-Reply-To: <20231223120642.1067728-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Jan 2024 19:18:05 +0100
Message-ID: <CABgObfZHRf7E_7Jk4uPRmSyxTy3EiuuYwHC35jQncNL9s-zTDA@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.8
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 1:12=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> The following changes since commit ceb6a6f023fd3e8b07761ed900352ef574010b=
cb:
>
>   Linux 6.7-rc6 (2023-12-17 15:19:28 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.8
>
> for you to fetch changes up to 118e10cd893d57df55b3302dfd188a981b6e6d1c:
>
>   LoongArch: KVM: Add LASX (256bit SIMD) support (2023-12-19 10:48:28 +08=
00)

Pulled, thanks.

Paolo

>
> ----------------------------------------------------------------
> LoongArch KVM changes for v6.8
>
> 1. Optimization for memslot hugepage checking.
> 2. Cleanup and fix some HW/SW timer issues.
> 3. Add LSX/LASX (128bit/256bit SIMD) support.
>
> ----------------------------------------------------------------
> Bibo Mao (5):
>       LoongArch: KVM: Optimization for memslot hugepage checking
>       LoongArch: KVM: Remove SW timer switch when vcpu is halt polling
>       LoongArch: KVM: Allow to access HW timer CSR registers always
>       LoongArch: KVM: Remove kvm_acquire_timer() before entering guest
>       LoongArch: KVM: Fix timer emulation with oneshot mode
>
> Tianrui Zhao (2):
>       LoongArch: KVM: Add LSX (128bit SIMD) support
>       LoongArch: KVM: Add LASX (256bit SIMD) support
>
>  arch/loongarch/include/asm/kvm_host.h |  24 ++-
>  arch/loongarch/include/asm/kvm_vcpu.h |  21 ++-
>  arch/loongarch/include/uapi/asm/kvm.h |   1 +
>  arch/loongarch/kernel/fpu.S           |   2 +
>  arch/loongarch/kvm/exit.c             |  50 ++++--
>  arch/loongarch/kvm/main.c             |   1 -
>  arch/loongarch/kvm/mmu.c              | 124 +++++++++-----
>  arch/loongarch/kvm/switch.S           |  31 ++++
>  arch/loongarch/kvm/timer.c            | 129 ++++++++------
>  arch/loongarch/kvm/trace.h            |   6 +-
>  arch/loongarch/kvm/vcpu.c             | 307 ++++++++++++++++++++++++++++=
++----
>  11 files changed, 551 insertions(+), 145 deletions(-)
>

