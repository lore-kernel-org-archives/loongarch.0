Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7194250BE4
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284790; cv=none; b=jEGjAnOe3mE0VHxrtaXF8CXCpPWZZ4SA1Ckm00U4wLbLFDHQupC65nfxe+Rnm+jCDRllXLwKI1NG8vhTOsE75nNHd/POtOwlRiRNY2izJd0uI+7Q2741Ma0tfRQKIokGDDEZeLQAom0iUsBblgIPqhDiToBrRmhDEPVwqCxWSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284790; c=relaxed/simple;
	bh=ulwfMWLqUipyPdhn0d5FcC7nI6gKuz6DeB1kG8AxMNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzoYK0s6IrMTbeGuW44Ceb+w4sLRKytDT9o3j7XejdaLFLpQAwmzJeVDN+ZjnCb77FUjAfe5YL8jBVg4q43y3+rsdBRMy5jLDWcKdNlaLCNAFd7D3tYAaqkPDLbc62w3Sca92AH1eCA8va4wlGBL9ZqoEMSXCFtieiboT/4tdr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP0rlXMG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP0rlXMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925D3C4AF09
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739284790;
	bh=ulwfMWLqUipyPdhn0d5FcC7nI6gKuz6DeB1kG8AxMNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LP0rlXMGLRh/nqMxHiNqoW3AR21kS1Fp9qT49KQsF2pUrNVejxJH0ybGchsu4V9Yn
	 VHe7MwTywpcPkaSPnBBMiQabSecYn8rmK9ifvMqax7UvfZIllX1k3G+DHMJZ2CORpw
	 DSMSZaLMQXgYZXT0I5S1YWLagVEwuSmwGuwlBvwZM/LdOBldlKVD5IX43ldU6FkdYv
	 uFraiWubH/fSBDqImIWpaSHo3a9NCs99icA7CU/rq8E/8nSj9xiOSCLR6nLyjeTWnX
	 XO4u2XtdLAoA0150ckjC0QrgS7XMaRDqAWK9QzFPLqQriAe3twjX8lLY/dN6oLj6Ib
	 hzlYq24RdQp5Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so66158366b.1
        for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 06:39:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuGPhGBYAD3MxQ889cjnerEGG3c3VgeW3oHQPAv8qx78wEzZBWxvBHrqvv11hRXnXaWbbAF8sK9cU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvj4aTF3SVvPYMWWYNGV6spZ+bCh/IwYxsnyH6fX9g83YfnJVM
	G2NQ+uqjIy1k+g3fzntwAZPlEFJVjdDcAZ8vPy+EdBpIriAyt/rZ8CF7jfs6rsoRG+jGIgvAecy
	pUdn01GPk/oOnYkJ8B+/UxW1Bx9Y=
X-Google-Smtp-Source: AGHT+IGLR5ULI7gGLte0l7vRhZ2ZWqb5CWOtTbE4sI1QcMB4fXVUok//FjZVBam+puAjUPcYnE1+qzleMg68ltPCw1E=
X-Received: by 2002:a17:907:9719:b0:ab6:e10e:2f5 with SMTP id
 a640c23a62f3a-ab789bf6ae5mr2003093166b.37.1739284789169; Tue, 11 Feb 2025
 06:39:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211020118.3275874-1-maobibo@loongson.cn>
In-Reply-To: <20250211020118.3275874-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 11 Feb 2025 22:39:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4w1sC93ag45Jx8B21Db4QRN3Jgtd1hqmLPEX3iCcHiWQ@mail.gmail.com>
X-Gm-Features: AWEUYZnKR2iBOFeYKrnSINo32nx0jZbTx4gSoq7LUFeCrgBTWcFZ7G7vKb2B6iI
Message-ID: <CAAhV-H4w1sC93ag45Jx8B21Db4QRN3Jgtd1hqmLPEX3iCcHiWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: KVM: Some tiny code cleanup
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Tue, Feb 11, 2025 at 10:01=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> There is some tiny code cleanup with VM context switch or vCPU context
> switch path, and it fixes typo issue about macro usage GCFG register.
>
> ---
>   v1 .. v2:
>     1. Remove comments about LOONGARCH_CSR_GCFG definition in header file=
.
>     2. Add notes why PRMD need be kernel mode when switch to VM.
> ---
> Bibo Mao (3):
>   LoongArch: KVM: Fix typo issue about GCFG feature detection
>   LoongArch: KVM: Remove duplicated cache attribute setting
>   LoongArch: KVM: Set host with kernel mode when switch to VM mode
>
>  arch/loongarch/kvm/main.c   | 4 ++--
>  arch/loongarch/kvm/switch.S | 2 +-
>  arch/loongarch/kvm/vcpu.c   | 3 ---
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
>
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> --
> 2.39.3
>
