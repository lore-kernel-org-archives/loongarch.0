Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D15D26A1C4
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900381; cv=none; b=tqqU+D8ySlQKNNxCZqEzjGmI1299YppmgzAROJYqTfeCERn5pQ8ofJzkFKZVhntyP+uSG+6Un6F0qCiwE3iBoy30kC3cvnu+qVqG7mZbbzsyDgO08ToHTNeBpzsrvg9v74VpvHTMlBPINnKYbDhbpt7u6hU6fJu5AfLlr+HR9hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900381; c=relaxed/simple;
	bh=XTrg9sh9z/zz/WffhF21Ny6WPfQ0gdSWCd4GZohzIxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMjGVuEFXYS+iFElvCARjk6ncQ2KUmRLr9XSjvS84F/g19oES3ddJovD5LWJRGWeOJ/mL959Akk9s/Zpa6yYS79WXL6MBX/fWDml0FKxBsN4A4bXerm5Hg2T3b2IzuDz/fp5CWeBxcH12H4Y1U+XTSXdYEYMBSNd1V3qTIonkYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecDVxlIC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecDVxlIC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af97c0290dcso717056066b.0
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754900378; x=1755505178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgbL89+jWcykg4VT77IwFJx/cFqzfg7ANmaGG3REd70=;
        b=ecDVxlICi03iR5mtdRolj+/WKYfvERalIZVFjqKwo+6uvrhdIAgpkKoyQzHZB/YSeA
         tycWmWT2fdS+mjFJZ/2b7SYPdGlJtzLO16qJngVUh8FarRGgPsgxDmNYNa7zr4Z4pnts
         RulUoNsgzGRkHQ5L0EPuB2LKJ+fiRA64y47DvTv+sQC/BCZ5SSPe1KC26x04Ng4qVRWI
         BFf8b9Xws92cRkDgIFPVmm2KCe1f2MWqEXntTz0IUP9ng65U4ybmAiGL6/iakdIMjLzr
         1RqrVldG69W0aUGkMuuqcWBet8+p0BoC3yWFfixuMkj/FPeYBeB7gPfsLJ1RnrhGewo6
         B8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900378; x=1755505178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgbL89+jWcykg4VT77IwFJx/cFqzfg7ANmaGG3REd70=;
        b=fpss7DdYCMINBRwD6ys04PGRyQtGv5yHbN1mmdnarvBtgWUEzHJHqJHdjmOYWswxN4
         zdmL7CERHLv5UYVxTivmLi26PIlpwEfHgZYYaHjyGCq85Jbrj24a4m5P/JAjZCco6cHp
         a9q+sVA0qjnDamTVucMVVNxHFe66ES0ntG9PNbsJ9a8oWBARmBCAlGAIkcjIOX2sBQuc
         6u9tX4HGp/5mhCBw/L9vbN8KhUnUwNxPa+M2Xgehi3YUHOTwOybcVlvVGthrKEzJ2Qcb
         XASAOguB9pRkSrEbYP5hukMxL5JWsW3le958c6HJwMAq4JQEnK/3v4tYsF4omlLcfMqk
         DXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgPnOTjsLM6OvrSICw8HFAB1s6yVFe7I/xznQAK+3OZjfzmAYy6mZ2j0ZbPM+4DAx9Xs/o6X/64Vo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUxN34q9x2IBjpZ1Ni+c+KA4FceFvnyLztCvmwdLxLq4b4zU4E
	RTLl8xFjMKdT2ZeFPb4HGrldIdNxGk/hEuunsxdv4MCRrf1+X+drzu5ZBukgJlL6l8XCRMbq5d3
	u1147BdhuuI95PZ/n7QpK3WDtjMEzXSI=
X-Gm-Gg: ASbGncs7NDGJ2bmJY8KqqyqPkW4NIQLQvWPAI2OQKRIsDHhoi3MxhNJWRJKt5yErty9
	TtmGRToFSf557rqAJV9JY3xZKUOmk1IVDzBEEgg82/EScABFkkMv9XdUkY2KKmbN0YMi+CKNZN6
	4mQMf6xK4qKVpGUIv9thwznJzQ9D6pzTjQVdUk3rGaGf61HOw12DLNV87C6gSqaU6htia/4DQyw
	2ftEx8S
X-Google-Smtp-Source: AGHT+IF8gqpHKUggAz8mRHFtabGXF36B1xtlX4P+D1pU+orCN9564Rlc80C3nmmzBa8cGbzuEi0zdw4YMnyQiNETI6E=
X-Received: by 2002:a17:907:7f02:b0:ae0:ce59:5952 with SMTP id
 a640c23a62f3a-af9c65f16ecmr931142066b.60.1754900377495; Mon, 11 Aug 2025
 01:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <a6b216e6726edc00a910ba543ef8f7a9195b94f7.1754890670.git.zhoubinbin@loongson.cn>
 <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org> <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
 <20250811-impetuous-civet-of-wind-febe58@kuoka>
In-Reply-To: <20250811-impetuous-civet-of-wind-febe58@kuoka>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 16:19:24 +0800
X-Gm-Features: Ac12FXyFB4EVt99-WdzeI01ERu2yfCN8TNLMEhiVAElN4xIXYzFbGw-dcmhbDQ0
Message-ID: <CAMpQs4J1ThxZqJupm68WmpQpkG2HtkRctk6zDmbszaHUyBm19g@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

On Mon, Aug 11, 2025 at 4:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Aug 11, 2025 at 03:42:09PM +0800, Binbin Zhou wrote:
> > Hi Krzysztof:
> >
> > On Mon, Aug 11, 2025 at 3:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 11/08/2025 08:03, Binbin Zhou wrote:
> > > > Add new compatible for the Loongson-2K NAND controller used for
> > > > Loongson-2K0500 SoC.
> > > >
> > > > Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
> > >
> > >
> > > Why do you add quotes?
> >
> > Emm...
> > Sorry, I didn't notice that.
> > I reacquired the V1 patchset using =E2=80=9Cb4 am xxx=E2=80=9D to avoid=
 manually
> > adding tags. I believe it may be caused by the `b4` command.
>
> Then aren't you using some old b4?
>
> I just did it and look:
>
>   [PATCH v1 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller: Documen=
t the Loongson-2K0500 NAND controller
>     + Acked-by: Rob Herring (Arm) <robh@kernel.org> (=E2=9C=93 DKIM/kerne=
l.org)
>     + Link: https://lore.kernel.org/r/588639de591ada408bdaeb0d279c5d62a4b=
53d61.1753166096.git.zhoubinbin@loongson.cn
>     + Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your reply and testing.

I rechecked my b4 repository, and it does need to be updated. It was my mis=
take.
I will fix it in the next version.

Thanks again!
>
>
> No quotes in commit msg either.
>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
