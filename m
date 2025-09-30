Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33EC8287E
	for <loongarch@lists.linux.dev>; Tue, 30 Sep 2025 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759252637; cv=none; b=J/VGhicb+dIM8YUMeXpwGFhmeOokp1pumFCXiKaOhCIU55FMf5ras1+y+E/Ql3+JHmE56UBqAw6ycVeeNPoxNIw3RyRMvp2tT8+O7zMUbj3ifJlf6NJeTQ2pEG33CY1yeKlok7wRVflHHgJ5ygA9WyxzhyfB/OB4js08gnMMgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759252637; c=relaxed/simple;
	bh=2TA85JhG88MKTbU/gfG3nGwNs6z1JUIysIQJJDXAdOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKYk7PAFe95I7d6smNRMfil+z1lPLjZPEufAQHEIMul+a8qfDGe4xUfCwaqpMEzDhutklyXU89BBeP8FBtpDc2vBUeme8LScHM3OftzaR4G9WVmXh790FqHPzCe5DWbFxAq1upBBGxzFEwiwzyLi5mh/9fXU/CpSR1eg1ITNeXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixfo8e/Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixfo8e/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759252634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2C3tUWszDTmoiAk0dwZyFPIXw5qdDN0uqN1IQdkVOiw=;
	b=ixfo8e/YPIXC1xrNAoQ9NHi0KblwO9OHJFcI2qnNX06F/Q8Boe8LiTi3gy5a6NJXeHdLcx
	GvTk4nxkWpwKFQnGTG0VS2foEuTAWp/t9LFFndyYUzny5PAtXkpW9vkZOqlCJ0YzoFFKP1
	mMIyYEhH+uOeL7XDa5O6r/bJPfal/Qs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-kaDSGP2yP--X9aWZjD-lDw-1; Tue, 30 Sep 2025 13:17:13 -0400
X-MC-Unique: kaDSGP2yP--X9aWZjD-lDw-1
X-Mimecast-MFC-AGG-ID: kaDSGP2yP--X9aWZjD-lDw_1759252632
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ee888281c3so6226318f8f.3
        for <loongarch@lists.linux.dev>; Tue, 30 Sep 2025 10:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759252632; x=1759857432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2C3tUWszDTmoiAk0dwZyFPIXw5qdDN0uqN1IQdkVOiw=;
        b=u+XW+LxnYe/QXe3ShxTJZBwMATAOljrLarKNDT4OfJyZ9gw2T2i8LhiKRonqJVPl0r
         ELMkAR+KxBJxxWSy69/xwUlu7ECUkQDX+EL6F7yI6bfeWW+e7wavZXsYPlx3z1b1s6IZ
         FZj28nntO5Lr2F0UaxlySIizh37HBx6+WEMBAUSb3wqRDMx/caCLzdNXOAzOsIxR/rQ/
         ypBcjHMevbPi4tVreg+Xtdqcc868IBQ0dc0wnd+zuuKGLi8+t4t+ZGRpv0xJiUvYR5SN
         vTDeZaCxVzwLIqiGnhdaBuM0xZAwgZz6plc/TceWa7K1czw+c7K82nk6UFR94PdxUIA2
         X9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWHS+cqy7TIegxME3TgJgHJd0o9/2MuAQJJVHArj29IDXec8vVQTovv2ljZ0CsXMDAWiy+z3vUPgVo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw17wEY/XF5OHOrxDTJhD/JdNgEntw3uewAwzvky0rDR/X1ETKK
	p1KH9PiuwSGZw+7sfa0xl8ewUZJgRNTkbHqZsqKp/zexE64AUP1GBq7f3vH6w0v3wGY5Mg77kHs
	+wFwB77tbWyEeo4cXdOJ1bExOQCZc75A2MlNHsQ+IzAh4qqZp0GfBcylLjNCtTMoVR+oQZfBCa0
	8IPm2z2+cRYAtD7S2Gx2g1RN+23dozIYz/rPoL
X-Gm-Gg: ASbGnctLHIarcVzdiwdDw+B6crsaFDaMSLugpxTLjzIO9YEIQV+Hvsf9GpE3lUFuj4K
	zNqys0DY3JDrFzkZ/hbOoSGycL5nc4GLlL9BdmXZ2K2FkjFhfhoO4HtPysvSRt7GAuRFjANoEQ8
	kapVarR/SZdULIJtKV2q5GEwgKU/ezJtFYV2Z9fKb0VuYM29k1fuNgxyUAspzt2sKTpudmorg4T
	vFIdidVuQOdxlQlzCDSJr7ZhHa9Vwu1
X-Received: by 2002:a05:6000:3103:b0:3ec:7583:3b76 with SMTP id ffacd0b85a97d-425577f3212mr441484f8f.22.1759252632222;
        Tue, 30 Sep 2025 10:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlWCVGpeAZLUKs0K+oxbN18oiVm08xlLaObPt5b2kGu4QXgX8tqNJMKW9uG4wk/tLSn8ve7rDKzfDZGh7oUUo=
X-Received: by 2002:a05:6000:3103:b0:3ec:7583:3b76 with SMTP id
 ffacd0b85a97d-425577f3212mr441456f8f.22.1759252631740; Tue, 30 Sep 2025
 10:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924081305.3068787-1-chenhuacai@loongson.cn>
In-Reply-To: <20250924081305.3068787-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Sep 2025 19:16:59 +0200
X-Gm-Features: AS18NWCIAUHM6q-f3EVvW3Rf6Uwq0MmF38t06GUExmaXllterNGLylxJXrEqQ8Y
Message-ID: <CABgObfZvdkAR6YGx7HKT+aVaE06w=FG7Jus=3B6nxadDiv5c_Q@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.18
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q7UfXquVh926hIV53Zq3W1cK2RE2s1Rl2nRmT5G1DYc_1759252632
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 10:15=E2=80=AFAM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> The following changes since commit 07e27ad16399afcd693be20211b0dfae63e061=
5f:
>
>   Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.18
>
> for you to fetch changes up to 66e2d96b1c5875122bfb94239989d832ccf51477:
>
>   LoongArch: KVM: Move kvm_iocsr tracepoint out of generic code (2025-09-=
23 23:37:26 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.18
>
> 1. Add PTW feature detection on new hardware.
> 2. Add sign extension with kernel MMIO/IOCSR emulation.
> 3. Improve in-kernel IPI emulation.
> 4. Improve in-kernel PCH-PIC emulation.
> 5. Move kvm_iocsr tracepoint out of generic code.
>
> ----------------------------------------------------------------
> Bibo Mao (9):
>       LoongArch: KVM: Add PTW feature detection on new hardware
>       LoongArch: KVM: Add sign extension with kernel MMIO read emulation
>       LoongArch: KVM: Add sign extension with kernel IOCSR read emulation
>       LoongArch: KVM: Add implementation with IOCSR_IPI_SET
>       LoongArch: KVM: Access mailbox directly in mail_send()
>       LoongArch: KVM: Set version information at initial stage
>       LoongArch: KVM: Add IRR and ISR register read emulation
>       LoongArch: KVM: Add different length support in loongarch_pch_pic_r=
ead()
>       LoongArch: KVM: Add different length support in loongarch_pch_pic_w=
rite()
>
> Steven Rostedt (1):
>       LoongArch: KVM: Move kvm_iocsr tracepoint out of generic code
>
> Yury Norov (NVIDIA) (1):
>       LoongArch: KVM: Rework pch_pic_update_batch_irqs()
>
>  arch/loongarch/include/asm/kvm_pch_pic.h |  15 +-
>  arch/loongarch/include/uapi/asm/kvm.h    |   1 +
>  arch/loongarch/kvm/exit.c                |  19 +--
>  arch/loongarch/kvm/intc/ipi.c            |  80 ++++++-----
>  arch/loongarch/kvm/intc/pch_pic.c        | 239 +++++++++++++------------=
------
>  arch/loongarch/kvm/trace.h               |  35 +++++
>  arch/loongarch/kvm/vcpu.c                |   2 +
>  arch/loongarch/kvm/vm.c                  |   4 +
>  include/trace/events/kvm.h               |  35 -----
>  9 files changed, 211 insertions(+), 219 deletions(-)
>

