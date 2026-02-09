Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F8385EE1
	for <loongarch@lists.linux.dev>; Mon,  9 Feb 2026 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657465; cv=none; b=B/nDtRQkqHZtnLN1A56aoaVF9px07Xcxl8WmcLi749mFtgA7i8JWfA9RZnc4znuKpWsHTsNhiPm4rbqpeblvW8xrUhXHaa/hippw7QO+hYUXMXsHF80+M922j1trscvdySisgqh25y1yxtKBAhX6P7HUGQvrYJsJRANdTC+PjSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657465; c=relaxed/simple;
	bh=3femj1AcnoV3TonaUwh7+xzY2aG/Sot2KV0a5e28QcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFt861hLX0jk5P21cJWQRnNUq7cDMSdD+og6LB0NPMMyeOTjs9mVFIccQ4BZ8r/rQrEQvhjZDDS2hDdfI1F8HcNrOgEAiExzZpR2KaVVMwX/cwp9ruDe1DVkouk4yFchHiZVZBfbxZNdVFJ5Nm26BH7ApMQ4x391zadTrH8Mqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BrMOqlaA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BrMOqlaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770657464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obiVR3q8SepdZAU9neUIjR9lqNQPaWsMI1bD68lMK6M=;
	b=BrMOqlaAFO13k3CPWBCpsPl2nWs8C2hqiOvMurgXh0Qg+CXi726Z1IIr99P02j0MLJMUsf
	aHpad6nnuwEtMdqWGhvNm7DLy8cExgHKDz20MS0+M7sbb4mnyMpp7WGycgkyklOf9LZCCH
	Atmtx3VfNpEYqCHztBr5Gy3jguLkpDs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-kk1-eEHJMj6g-voQHXgvHQ-1; Mon, 09 Feb 2026 12:17:41 -0500
X-MC-Unique: kk1-eEHJMj6g-voQHXgvHQ-1
X-Mimecast-MFC-AGG-ID: kk1-eEHJMj6g-voQHXgvHQ_1770657460
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4362f8b5a65so2817541f8f.0
        for <loongarch@lists.linux.dev>; Mon, 09 Feb 2026 09:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657460; x=1771262260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obiVR3q8SepdZAU9neUIjR9lqNQPaWsMI1bD68lMK6M=;
        b=Gze9aiuXOnJuIvGguRlVFqNniDK00GTbyxuBnhiAJkTQcYj9zgbA4BEHPXnvJzzQPv
         5U3VSzxaUdqYeJNffp/xccs/RlmCT1huXuvd5chsZ20WxgbcmfTHtgoS9hkmR1PeEYrX
         u9+VrVkomPhL/kotxNxwpEFNUXVwAhW8urz4e6nId+Tqsmcs8f1ngTKk56IDWviVTsFQ
         opDn9AI5IXc5WuZCHjKBYKRXbKPrzwfxW4S/g6qdhe0O8bXrU/0f9kYLItCCSWucGVlq
         JM7csdrXS6/LB9+df+OwHAmv47oNwFeM+WfyP4uAcFxcNwmmFte4FoTZoBguHo9kXbkL
         6NRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyTAmowD2s84zK0ew926CvUmQnGyB3fhsp0zveOt2ZIMeFp2Uoci26QZMJMzOomafVV5kpYQmceKI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk1Q7IgNPK0hKosBmQrMBtmDtMT7hsm24FnpbXGMzQE4VGYnPk
	yhNTqmK29kJTj6scW4Zj2DLNmQtWdNkKq8CGi0BwCHs+UGYMGzqLekh7kLFaJ0rwkEpvRFePavm
	CKb3hd/f5eL9pHtaEyzSobySe6ByU4TAfkMH8rDsU/Fd+JYFY/lItkgrZ+/807/4ptvE0LmgPfE
	C1D601WZv87ElMOO93A9JNx+0+j0hl6mEERTLU
X-Gm-Gg: AZuq6aJJjT9PERJVSBC8Hy94Q51DurvVQXRMikYKySA5bDB8Mn8q/4Y9qQjyPFO3rvi
	o2wMMgzG6J70eLYGr8K0U9MjqSAs27L211WgL8CsiQcKsXvznguecT1KC1VhdypcBFOk7msvrCa
	5y6ujEvlGRm8eTjVWNDSMKJU5Vz5DnRIFDeifEmJ++L94xhMFycNJ4afoSlgQbhxdMize4HgsRS
	kXimM7a1txwkwfCIydefblD3QphPZ5duWwffWZl2J7S6N998e7mLhq3ufjJby5SqUHLCg==
X-Received: by 2002:a05:6000:400b:b0:436:14fa:a3fd with SMTP id ffacd0b85a97d-437791ea33amr172517f8f.24.1770657460334;
        Mon, 09 Feb 2026 09:17:40 -0800 (PST)
X-Received: by 2002:a05:6000:400b:b0:436:14fa:a3fd with SMTP id
 ffacd0b85a97d-437791ea33amr172482f8f.24.1770657459828; Mon, 09 Feb 2026
 09:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260206145622.2433924-1-chenhuacai@loongson.cn>
In-Reply-To: <20260206145622.2433924-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 9 Feb 2026 18:17:26 +0100
X-Gm-Features: AZwV_QjBtz9lA_DiHImRN_CVO1-zyt5IKnzotZXjwj61dvndjwONXCdx2J-FJDI
Message-ID: <CABgObfYtQcXV-GWYktTq04KZKEVLyVGx4wz7XzgA6sdy=iTHsw@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.20
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XpMEyZ2nNMPVdPeTFJ7OTjhfaq8ruzItpg7RvM1Gev4_1770657460
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 3:56=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn>=
 wrote:
>
> The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b=
62:
>
>   Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.20
>
> for you to fetch changes up to 2d94a3f7088b69ae25e27fb98d7f1ef572c843f9:
>
>   KVM: LoongArch: selftests: Add steal time test case (2026-02-06 09:28:0=
1 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.20
>
> 1. Add more CPUCFG mask bits.
> 2. Improve feature detection.
> 3. Add FPU/LBT delay load support.
> 4. Set default return value in KVM IO bus ops.
> 5. Add paravirt preempt feature support.
> 6. Add KVM steal time test case for tools/selftests.
>
> ----------------------------------------------------------------
> Bibo Mao (13):
>       LoongArch: KVM: Add more CPUCFG mask bits
>       LoongArch: KVM: Move feature detection in kvm_vm_init_features()
>       LoongArch: KVM: Add msgint registers in kvm_init_gcsr_flag()
>       LoongArch: KVM: Check VM msgint feature during interrupt handling
>       LoongArch: KVM: Handle LOONGARCH_CSR_IPR during vCPU context switch
>       LoongArch: KVM: Move LSX capability check in exception handler
>       LoongArch: KVM: Move LASX capability check in exception handler
>       LoongArch: KVM: Move LBT capability check in exception handler
>       LoongArch: KVM: Add FPU/LBT delay load support
>       LoongArch: KVM: Set default return value in KVM IO bus ops
>       LoongArch: KVM: Add paravirt preempt feature in hypervisor side
>       LoongArch: KVM: Add paravirt vcpu_is_preempted() support in guest s=
ide
>       KVM: LoongArch: selftests: Add steal time test case
>
>  arch/loongarch/include/asm/kvm_host.h      |   9 +++
>  arch/loongarch/include/asm/kvm_para.h      |   4 +-
>  arch/loongarch/include/asm/loongarch.h     |   1 +
>  arch/loongarch/include/asm/qspinlock.h     |   4 +
>  arch/loongarch/include/uapi/asm/kvm.h      |   1 +
>  arch/loongarch/include/uapi/asm/kvm_para.h |   1 +
>  arch/loongarch/kernel/paravirt.c           |  21 ++++-
>  arch/loongarch/kvm/exit.c                  |  21 ++++-
>  arch/loongarch/kvm/intc/eiointc.c          |  43 ++++------
>  arch/loongarch/kvm/intc/ipi.c              |  26 ++----
>  arch/loongarch/kvm/intc/pch_pic.c          |  31 ++++---
>  arch/loongarch/kvm/interrupt.c             |   4 +-
>  arch/loongarch/kvm/main.c                  |   8 ++
>  arch/loongarch/kvm/vcpu.c                  | 125 +++++++++++++++++++++++=
------
>  arch/loongarch/kvm/vm.c                    |  39 +++++----
>  tools/testing/selftests/kvm/Makefile.kvm   |   1 +
>  tools/testing/selftests/kvm/steal_time.c   |  96 ++++++++++++++++++++++
>  17 files changed, 319 insertions(+), 116 deletions(-)
>

