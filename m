Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189C13FEE
	for <loongarch@lists.linux.dev>; Tue,  6 Jan 2026 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667030; cv=none; b=sbhXTAM1mCUtTttmHQoLcOp0K72FT08OSUBgseTPxWjyBr5lV2dyc5op267xYKv0Ue9P7i9UldL+x1G3ZtHU2Nc1eHituQXb5PYzhJof87ySM+HEK+o1JDIzLopD327WJRffxTaMA87D/3EYPD0GQS8EqNvJxRc/75gU1YJMo7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667030; c=relaxed/simple;
	bh=afIUqb3DvHxyS15DCjgNS5NEeeMcbj46bZ3VM3DeYyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dv4sFbqSvN2VcJfbRlBvA/EMyHqabtjkPl8Hq/LS/XThaHcvaaZqkBo1dHLCqnKeGGn4+rJ8Mhqb5S0qbU6IxU9Gn9qGsW5kIwcqTtCf67lmHQXdVmJPRZEGNLRjaSa/TLBUhkYJVhEaWHtLof3ua3mZAbYSL3Nfnk1P/H7MrTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIZ4ig0I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIZ4ig0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6256EC19424
	for <loongarch@lists.linux.dev>; Tue,  6 Jan 2026 02:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767667030;
	bh=afIUqb3DvHxyS15DCjgNS5NEeeMcbj46bZ3VM3DeYyI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AIZ4ig0I8qU9GHKmI9b+inNMEuQFTyNPnIlEIjBg0WbOEfbgfgb/cJt66tsE5zYJf
	 3n4MJ4yn7GIdUyEvOFvn7+OLifYDi+y89EicnWOUBoyPMZ+1IZTRuQP0MBQXT9Cgiz
	 nBc6Ur3hvyqB9hQBVvKH6ikbEtC6aHFHZbqo1uBIUxKFoYC4F11UZyZvu5x0drn1Bt
	 MSMi5Bwo3hoz1yAycCJeoKixhfoxw0PtU9QO96f1t+s3ZyJvcx/e5dBahvBUbJcdwU
	 H8vZ5UNTBbj8PhKcPCXrIVhoAvq+AlPFWFku6IvkGE0cBzIZfXEvL5jnp/8XIIVGYq
	 bBuywhaqc91Zw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b79ea617f55so109195666b.3
        for <loongarch@lists.linux.dev>; Mon, 05 Jan 2026 18:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/fPQEe84S/lSiHWGUOqmIVTNT0aT4769fRG804hORIiXDnxj+l1hDPMLpw2J4VHzFT/vqhWB8t24=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxZgHOMlPi4dl8xy7Bnm2KY5T/SfA/BiRI0KfptrQYPFAqMteS
	Hgq1muJBPCm1Wnr5eacXpNW/CaBDwqAX+DBQBOMSXZYemiriq8b4coTwI3ubjAhSM99ajsnypk6
	pvAPrJznYIBfRPftPwmngViOHvjvC9K8=
X-Google-Smtp-Source: AGHT+IH5wLLRWJAFZnJvN5U5uPoL6QWZ1IlaZ9aPxjzw2GHzFg3P3VV/5djmehjISUCniROvtBcolGFJhK3+AjiKamU=
X-Received: by 2002:a17:906:c101:b0:b77:1b03:66a1 with SMTP id
 a640c23a62f3a-b8426bc2947mr164173366b.41.1767667028913; Mon, 05 Jan 2026
 18:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767505859.git.zhoubinbin@loongson.cn> <15d61a50f0fcca34f6a5da5fbfdb181646d60fee.1767505859.git.zhoubinbin@loongson.cn>
In-Reply-To: <15d61a50f0fcca34f6a5da5fbfdb181646d60fee.1767505859.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Jan 2026 10:37:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4QVRhJCOnkSSRN_DJ1D6G8Djshw3aUP7iFpcYQdinwwQ@mail.gmail.com>
X-Gm-Features: AQt7F2o9SduJlM2bMy08yy-CFuYIRCdeiHqcNy8glfc9_k0bBmm5RUA4DpqdR-M
Message-ID: <CAAhV-H4QVRhJCOnkSSRN_DJ1D6G8Djshw3aUP7iFpcYQdinwwQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: PCI: loongson: Document msi-parent property
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Rob,

On Sun, Jan 4, 2026 at 2:41=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> From: Yao Zi <me@ziyao.cc>
>
> Loongson PCI controllers found in LS2K1000/2000 SoCs
> (loongson,ls2k-pci), 7A1000/2000 bridge chips (loongson,ls7a-pci), and
> RS780E bridge chips (loongson,rs780e-pci) all have their paired MSI
> controllers.
>
> Though only the one in LS2K2000 SoC is described in devicetree, we
> should document the property for all variants. For the same reason, it
> isn't marked as required for now.
>
> Fixes: 83e757ecfd5d ("dt-bindings: Document Loongson PCI Host Controller"=
)
> Signed-off-by: Yao Zi <me@ziyao.cc>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
I found that you picked Patch2~Patch4 but left this one. Why?

On the other hand, Binbin said that if the first 4 and the last 5 go
to different trees, then there are still build warnings in separate
repos. So if possible, please also drop Patch2~Patch4 and I will take
the whole series to the loongarch tree. Thanks.

Huacai

> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/pci/loongson.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Docume=
ntation/devicetree/bindings/pci/loongson.yaml
> index e5bba63aa947..26e77218b901 100644
> --- a/Documentation/devicetree/bindings/pci/loongson.yaml
> +++ b/Documentation/devicetree/bindings/pci/loongson.yaml
> @@ -32,6 +32,8 @@ properties:
>      minItems: 1
>      maxItems: 3
>
> +  msi-parent: true
> +
>  required:
>    - compatible
>    - reg
> --
> 2.47.3
>
>
