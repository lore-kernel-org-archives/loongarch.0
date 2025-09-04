Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729D242910
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015155; cv=none; b=HHtxWlQDqvXppJIGkMhk8CeWSmnnw/rBR+YDDdGLS+ZzNe1DYBsIyfOokxltOcXpaf41LMR1WRYjM7cs0xnKaHD+IeRHpeNk+aXmlcTsF4Vj+E/x6o2HF28JFB8SN09K8bbC+mQfFC9iXnXbckxIhF4CqUNEaiKMANSRIt1SZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015155; c=relaxed/simple;
	bh=hzWQ+NZvkCjPqaF5rQWuE+BV3WjbZDFdOwhEuuB25rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2hEWDx5jTE6+JnVX3fEMGFDhVt6vU9tI2ru8cjLxKppwRE+2KuLucdA7iZ0IjhgAjxpjeZYmMeK2J462QPQIVBeGFTLZoOvvzcEb11otvzxX1U6hHF6ZtQStJMkZD3ZYCup2+Yk9/tEDPe9nkSycFKWk7ENHww8LHTbSKZmekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aXY9JGxm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXY9JGxm"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336cdca64e6so10684631fa.0
        for <loongarch@lists.linux.dev>; Thu, 04 Sep 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015152; x=1757619952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzWQ+NZvkCjPqaF5rQWuE+BV3WjbZDFdOwhEuuB25rY=;
        b=aXY9JGxmJyMcUWAY32njJjnDymamQm94F89BCgzuMYTuPR3LvlUvhmxymHg/hBXzEL
         tERft4izXSzg+ny5uRvIjawF1iBNk1hpJfwn3DW+OL1Ix3s+xvtRsujs7TO93i9tt/T4
         ljlXxzFwnySiMOKnEIOtqny0p7Frgx2p3fmCoiD6fcBYwCUfduXT0XZT4BRrHM1Rs/yF
         gnER/1ItrZMLb6E+ju91TcbI1JFKzLKb1Wef0PnqcPxmYX9ASzdOGg1d4s1zRpfj0806
         KuuDseyE5BL4qEXLEeW1fQUucr4R4OO5DyPu5Ct+9yrT3MTUB8Ww/lgw8txugUlXtr8q
         nsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015152; x=1757619952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzWQ+NZvkCjPqaF5rQWuE+BV3WjbZDFdOwhEuuB25rY=;
        b=R8/93LbA4jOoGZTGAu3jGDBlp3IHP2lRcLlICSGZ64tzidnxI9sQ5L6Va5ty6xrU40
         RqbcMGpGvBPRDBlqO8ztEHgvH8lw247yxjMZtSVdxYs5gxMBtdUOjwAGCicLvLV8KcE0
         WNz92ufo6KlVYY3ObJSXx+n5CfAwSG039UQG4VNyI6sJ3FStqL51DHaWHpvVX0SoUbZx
         ZR+iB8vTCM3TvkpnUPhTVRLigrhwtZ3PtLIlczI9SMjd/tLGpkyQOoDJwBtkputpafOo
         7BOpNOP4IicFi8GPqF0PWN6pE5k73XNGNo7Nfw5FoINDUbwXr+a5CVTn7CeQUICi0Cy2
         mS9g==
X-Forwarded-Encrypted: i=1; AJvYcCWEr4G9ToIo6+j3X/BcooD1snfXBWlTp2JHN6vej/TxJESS8L74fsgHiyy7Cyka589JUtEFmKn2IeI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8xlrbj4Gzk1J0F5FJRv2rqV3QJG14+lZpJ4bk2co6n4ZwwnOS
	jVrjpomJiQtURjXHTLC/UouTkBMmrRt7a57GVDKXeo60zJr3k4hZJEEsHqU7nX/23ENnb5ds6K4
	32QCFmi0y+pMmFT1vGFHAUAuin79PBnj0KhJtef4TNw==
X-Gm-Gg: ASbGncvyA6PWqo4kBylF3gsPoz3C+5rtDNSdLNGHb3xzTMU/BAcxbDRcp+aJP+uXXv7
	kS7HZKsJNcnWCRZi6VmAYoZ17RyE+Adc/nyX3hpxqQ1sFMaeMRJ9+ROzu/m7I256BtjGsjuc7Vq
	w0E2OPmTBGtFahBTx9g9k9yYFshkDcf2s0ZnQN0vRUIhJbwv3X2bU7Wf/1VdQXOCdhyhzBm3qpy
	1XxtIZQyYLlYqOZLw==
X-Google-Smtp-Source: AGHT+IHyOco31RUv2Oe9cKuPvD0Htgm4IoRC25q2CFRrREw8Wo2WlCc9mBvTU1sMDJcN9tENLMEe0p4jJKwMHOJBxZ8=
X-Received: by 2002:a2e:a54c:0:b0:337:e460:bef6 with SMTP id
 38308e7fff4ca-337e460c680mr43543631fa.10.1757015152027; Thu, 04 Sep 2025
 12:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250904013438.2405-1-ziyao@disroot.org> <20250904013438.2405-2-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-2-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:45:40 +0200
X-Gm-Features: Ac12FXx4X2_pNhzcdcYEzziDJRvtowb7CpE7cKPonDOwSax6LARZw_4oRio8qGA
Message-ID: <CACRpkdZfruCqEzN-sMtxidh_e7JM1e_LG3JKaQ3ahkDAnx59Cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of LS2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 3:35=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:

> Loongson-2K0300 ships a GPIO controller whose input/output control logic
> is similar to previous generation of SoCs. Additionally, it acts as an
> interrupt-controller supporting both level and edge interrupts and has a
> distinct reset signal.
>
> Describe its compatible in devicetree. We enlarge the maximum value of
> ngpios to 128, since the controller technically supports at most 128
> pins, although only 106 are routed out of the package. Properties for
> interrupt-controllers and resets are introduced and limited as LS2K0300
> only.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
