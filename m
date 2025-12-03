Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BAA2FCBF0
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769982; cv=none; b=tsnSVUFXgr64OPu2PiywhnJ0KHfqxmWYjttKincA+8d/yaya9l3V6b1Yw62PMjsvXaMbeWj2GngfcS3SYYjgcNR8H8yu98M2DFAWzeZ5pHxlaztWs4jkbEgskRFbXgmS4OZ2+qpaJUsX4dsCdUj4Td1EYtvs2Yh4cU0+tvON+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769982; c=relaxed/simple;
	bh=n4RI5Jiu9986T7JMQScrf+uAdP9SKadxsZKIGiQL6Pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6IXzaCPgmMdae+Dhv9RgrrfzWGW/pAfi1C2cjEPqnprigKGiFvxHbpGoUqG8FMDKBB9b4n1Xqnyum9YCbFzI7XU+Havlc+FdoXyG5CwWGtQRmrDrxQVerp675jJob4qrqi401wWGJ5A0p2Z7+hSOTm0lyQkFAHdTYKvV2MKZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+vZL3GJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+vZL3GJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D35C2BCB7
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764769981;
	bh=n4RI5Jiu9986T7JMQScrf+uAdP9SKadxsZKIGiQL6Pk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e+vZL3GJiUtMTtcMrkjvnBD7COns443EnZBXP1+Sg/k5wGTP968p7Ev9lnK0KrVTM
	 esFfv6Q0BexsHzjpe7T+TZEENhgm3PuHlTpcmqB4jj897g7H9IxazwHXpRb7tBChIE
	 BeNy0cXDwe5KyILnoXub/Rl2ijybsGs8b5gAUYnGAV3qAFhCG9CprFJyLMBrDvbm4P
	 R25BvBJCq55mUMZXGL0ZVxexFAt6mPJvqeGCpGkyBVj61U6DCVPhaZ9CqdRMj+ifwo
	 Qqgq9F8sRjfxbPdOy3PRfG9s1lNnM46tQb0NJHistgQiNSVhnJgucSPm2VHt0zU8u+
	 wtHlQdHlIrQ3w==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so11277967a12.1
        for <loongarch@lists.linux.dev>; Wed, 03 Dec 2025 05:53:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhJNpESHBLU9gWT29/v0U0QH701MqdG3vG16R3Yi8/54jiHbsGgEZUI2/JA8549UviZxOU26iBQdE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Yn2gWm9eQLn5s7p0ccBtziP3q4vW4V+mVUawNksenzSSQcFF
	og6//fx/6C/t6N3HcvB741Nos8i1yClQBINho413KOmdaqSsycACRDMC/XUZeAD17xXb/QUv/dg
	tdoL4vUyrZA10S8LIwkaunAqYjFpCrYc=
X-Google-Smtp-Source: AGHT+IFzt4agWF7wXECFYDFAOLScNNANZI/18D50G4cT3yjKzFWTJV2a2+sPxfnPQoYwfSgyJelU7/ftQyHquFeCp4c=
X-Received: by 2002:a17:907:1c1d:b0:b73:806c:bab2 with SMTP id
 a640c23a62f3a-b79dc719ed3mr266069766b.33.1764769980164; Wed, 03 Dec 2025
 05:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203092849.130284-1-wangyuli@aosc.io> <d695ad6a-ea75-4922-b544-174f3a547f8a@aosc.io>
In-Reply-To: <d695ad6a-ea75-4922-b544-174f3a547f8a@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 3 Dec 2025 21:52:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5tpiaCD6DM1V6AZRFYpprk9RuUNOVadcHOxbOWPc0WHw@mail.gmail.com>
X-Gm-Features: AWmQ_blbMhNeopmr-6yBvuVQ2kL2cbaEerN-rnrFKd538GmEbjMuG8q3g3uQsPw
Message-ID: <CAAhV-H5tpiaCD6DM1V6AZRFYpprk9RuUNOVadcHOxbOWPc0WHw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Use __pmd() helper for __swp_entry_to_pmd()
To: WangYuli <wangyuli@aosc.io>
Cc: kernel@xen0n.name, akpm@linux-foundation.org, david@kernel.org, 
	willy@infradead.org, bjorn@rivosinc.com, agordeev@linux.ibm.com, 
	zhangtianyang@loongson.cn, apopple@nvidia.com, thuth@redhat.com, 
	linmag7@gmail.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WangYuli <wangyl5933@chinaunicom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 6:05=E2=80=AFPM WangYuli <wangyuli@aosc.io> wrote:
>
> Hi Huacai,
>
> On 2025/12/3 17:46, Huacai Chen wrote:
> >> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/inc=
lude/asm/pgtable.h
> >> index 03fb60432fde..4e09f7e8bbec 100644
> >> --- a/arch/loongarch/include/asm/pgtable.h
> >> +++ b/arch/loongarch/include/asm/pgtable.h
> >> @@ -299,7 +299,7 @@ static inline pte_t mk_swap_pte(unsigned long type=
, unsigned long offset)
> >>   #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
> >>   #define __swp_entry_to_pte(x)  ((pte_t) { (x).val })
> > Why not change __swp_entry_to_pte() together with __pte()?
> >
> > Huacai
>
> I haven't investigated this closely, but it's odd that changing just
> this one spot was enough to get it to compile =E2=80=94 there doesn't see=
m to be
> an error at __swp_entry_to_pte.
>
> But you're right that changing both together looks neater.
>
> If you think it's necessary, I'm happy to submit a patch v2.
Yes, please!

Huacai
>
> Thanks,
>
> --
>
> WangYuli
>
