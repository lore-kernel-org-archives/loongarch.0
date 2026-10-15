Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E7346E70
	for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052020; cv=none; b=LQ821IPGUYrVHSClASaC0WxFEQQFq4FlACmRhw+jeyTCj2cxEpCxkQEb/IJIsSSlOC2BUVuc2cHTiaBk0AZ2+YZ1YjKwYoShHX1XrCDYnp9lbRdILkobZfiYo5hrBl3Rdz07MDh2QXHQwZi79Faj4nNCRIrwhKwxzFvrfbwDX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052020; c=relaxed/simple;
	bh=BCYd5zKHIb6pmPgog6YamRVpW3AdTCXLTOKv22hGEBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z142m3cu+TYRWY4P7OumuTxs6HjlKy1aDR/tMdxvF+arEw0sbaWgAY8HMBdpZuW0dnmKbB1tDKmaPiYyWBag5HwkbBGALjzjjNrKtlso58eRkX0YHrgtqa0+P/YLIcF1cySmwWXhAXlowTTb/bKtG6HxrWMADJnZwBIm55gT7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VPDHpc65; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VPDHpc65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792052017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AU0xO7xiIuUh7YL7a7ID/AwdZghoxbnnTVjxgl5m5Bs=;
	b=VPDHpc65+YVv/cNEa9KDu2iyjbcQS7maUCxYqTlK6l9/eq0hOwrgDBFAlihCbuDeJFggTU
	YSuRCWU5cqC4q9MsT/1+5xieO3KUt587crsKhQNFBqK7FSEIMi8QHap318BxFpPnrfBshy
	fQ+8e1QrVY5yBpS4hgX6VWANAuY5B7Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-xKTGJj_CNVq3Afcjy0Ph4Q-1; Thu, 15 Oct 2026 08:13:33 +0000
X-MC-Unique: xKTGJj_CNVq3Afcjy0Ph4Q-1
X-Mimecast-MFC-AGG-ID: xKTGJj_CNVq3Afcjy0Ph4Q_1792052012
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1bfd5516bso5109265e9.3
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 01:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052012; x=1792656812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU0xO7xiIuUh7YL7a7ID/AwdZghoxbnnTVjxgl5m5Bs=;
        b=TPZ52jV+K/FVJYLob0jX1YZMm5pPRu14Uh8e4VZZPoBXcNR+zo5lNgTPR0FUHhhWZ8
         AjYOkyjT3pk3sT8wFwqSbgJ0STSXSn9TdmVJKrAvJVBuUfXV7LijFD5GPJAq628MDYWi
         7JhZL1yWV4zm5C7h3H6sOhr4wlJNARMAupMU6DPSEwl8gV7ZvNJfi2+kqd7Cn6C2h/HP
         2mLrgQyrLumXO88mmZYRmLNzv8ryJ4M8RGUeY6/Adj+KY5jejrXlrTcuEVh1U7r29S0U
         OfI7U7oF94oFCZ7C9eDN0VpNCJ7n4fc4tyTaOuOVP+HXa+BtreKc2SkVmNmRrEBcecc1
         smmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdY8QOo6JjiznyYiMca2CGBnYCpZ/F+SyaUJ7oUBqoN+x9fum/WUG1zOT/xqaTpwzI9pke52RMrfM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJAHrGVIGJfN2aqmJmPPTQs9Shk5CG8Z0t8Q3iZiIkrQJnGqfBl
	DXHfY34rh55dovs3jTb1MuFAIiIvZZ8zkW9RNnqPJxnVxj/4ajFHSxL4PuMARMjEhxyviK0uqGS
	XfUhNo6a9XErIGn+ySXRqLV41MpNCy8eCMEsnYZpK+96OWoESubG4efXYSz55ARmyd9ZEGO+J7v
	SOMTTyklsiRJcbRkhFnOxjhdxZEqb+1U602ajcOyo056dg
X-Gm-Gg: AYBFou38H5PPpnCXTDVTR25gApA1Afrj1ZKrsiEoV0hfr9UKW2oZigmAuXRL6HNw8db
	Hn8NknMq/OeB3dHSSY7zgyuMOqRBnl6Mr11x8ra095eC2ZhSMO4bTXCrxETheV6/TaLE1XX3A65
	mpu8Motkmrrms/ic2C1lAZ/fVyibjuGwwWBZKQl8XazDOml8v8iBIaGZq9i5X6pZYMIU3CPaz6I
	jCPKK+hK20WiJEGlSMHk9yD6CSwUDmzGn0QRKcxji1TPB6ScYk3VLFaMCF4hQ==
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr370153105e9.19.1792052012067;
        Thu, 15 Oct 2026 01:13:32 -0700 (PDT)
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id
 5b1f17b1804b1-4a18e4c05e5mr370152605e9.19.1792052011600; Thu, 15 Oct 2026
 01:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015064656.1525830-1-chenhuacai@loongson.cn>
In-Reply-To: <20261015064656.1525830-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 Oct 2026 10:13:17 +0200
X-Gm-Features: AclHuK-N6y3qu8Vg7-uaSs-vNc8ppvQ0yoTimFzinJPuSt1vYpru_CK0wq-a7q4
Message-ID: <CABgObfb1GuJioOC5WEEY+ZJ6zCDH-gXr2Sg+20eF4AAVyE2_NA@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v7.4
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FHYNV9k9QKXjoYj_jeI_PqFyx3WE3pdzNCWOIj784MA_1792052012
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:47=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c9=
07:
>
>   Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-7.4
>
> for you to fetch changes up to 34f4ce22cf25802d8026c60c13c2db81f8c8e3a0:
>
>   KVM: LoongArch: selftests: Enable HW PTW by auto detection method (2026=
-10-13 16:49:05 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v7.4
>
> 1. Add separate vmid support.
> 2. Simplify MSI intterupt injection.
> 3. Add hypercall crash support.
> 4. Allow to set pv_feature until vCPU run.
> 5. Enable HW PTW automatically in selftests.
>
> ----------------------------------------------------------------
> Bibo Mao (8):
>       LoongArch: KVM: Add vmid support for stage2 MMU
>       LoongArch: KVM: Implement vmid updating logic
>       LoongArch: KVM: Probe & enable separate vmid feature
>       LoongArch: KVM: Remove parameter "level" when injecting MSI
>       LoongArch: KVM: Remove duplicated checking with DMSI irq injection
>       LoongArch: KVM: Add hypercall crash support
>       LoongArch: KVM: Allow to set pv_feature until vCPU run
>       KVM: LoongArch: selftests: Enable HW PTW by auto detection method
>
> Chaithanya Lagisetty (1):
>       LoongArch: KVM: Return the actual error code in kvm_ipi_create()
>
>  arch/loongarch/include/asm/kvm_dmsintc.h           |  3 +-
>  arch/loongarch/include/asm/kvm_host.h              | 15 ++++-
>  arch/loongarch/include/asm/kvm_para.h              |  3 +
>  arch/loongarch/include/asm/kvm_pch_pic.h           |  2 +-
>  arch/loongarch/include/asm/loongarch.h             |  5 ++
>  arch/loongarch/include/uapi/asm/kvm.h              |  1 +
>  arch/loongarch/include/uapi/asm/kvm_para.h         |  1 +
>  arch/loongarch/kernel/asm-offsets.c                |  1 +
>  arch/loongarch/kernel/cpu-probe.c                  |  4 ++
>  arch/loongarch/kvm/exit.c                          | 11 ++++
>  arch/loongarch/kvm/intc/dmsintc.c                  | 36 +++--------
>  arch/loongarch/kvm/intc/ipi.c                      |  7 +--
>  arch/loongarch/kvm/intc/pch_pic.c                  |  6 +-
>  arch/loongarch/kvm/irqfd.c                         |  4 +-
>  arch/loongarch/kvm/main.c                          | 71 ++++++++++++++++=
++++--
>  arch/loongarch/kvm/mmu.c                           | 25 +++++++-
>  arch/loongarch/kvm/switch.S                        |  5 +-
>  arch/loongarch/kvm/tlb.c                           | 19 +++++-
>  arch/loongarch/kvm/vcpu.c                          | 15 ++++-
>  arch/loongarch/kvm/vm.c                            |  2 +
>  .../selftests/kvm/include/loongarch/processor.h    |  3 +
>  .../selftests/kvm/lib/loongarch/processor.c        | 16 ++++-
>  22 files changed, 194 insertions(+), 61 deletions(-)
>

