Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B27371
	for <loongarch@lists.linux.dev>; Sun, 23 Apr 2023 08:31:12 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54fe25c2765so47967547b3.3
        for <loongarch@lists.linux.dev>; Sun, 23 Apr 2023 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682238672; x=1684830672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QYHi1U0H8xeoz+ojliRlXjskKQpNh5ZppQiWqXTPmg=;
        b=n29GfRgV2KM71xU0PJGUus7tcaVrQNRqxRyd9+C9ZSMxc8Yq/JBo/iyYfjmiVoYYVj
         qyYpoSFV4EujOpAf8Wg1c+bCAVeXWsCkfQ2qKGa6aDClLJX5kdMICEN5JxRZPiOnrkjZ
         qk8nMo0M7GYahnpKfhmGCnZ2lgiCs82VuqTGk/yZSDcJrz9qMsp44xHGI8IK2GGFO1HA
         GyjMDS0KD10qaZ9TDbZt84E4LOQ5QQnu+EG/eKNjMOhMSRaOXXguE6q9kSopTiTOtl/k
         Ekx4/5wyneuO1PYQCELdkr6kn6rI2Vtz5FpnjdZPRMk3rnc9ySYn59vCp02SK2gn1IL/
         uRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682238672; x=1684830672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QYHi1U0H8xeoz+ojliRlXjskKQpNh5ZppQiWqXTPmg=;
        b=f6Zm1yNFrY4zW6/UfHQqGIigw3s92rEaeweUtzpm+eUmoxEuU4wFKfeWBO4pslTgZB
         4AHkrzcKJJr61T29SQw1ft7+rYsL2uLn/m84E2xbY4jkdSm+DH0FxqJcQYHb0kOpx5Kq
         HV3ZiGsiFxMQMniYiSexINSNpOVu0qlmXCPcCE+JP/FPNpj7hSWw4QnziCcWVtcULD6k
         mrvcaBezMp8k7s3S15YKS/6tLLKmRR/gxrp8Y04ayW3uil+uquLrSuMZIU2O/KSpyOnq
         7kKaHhlP7S9+DtvFcuFaGvpsRyEgvdwwm3j7NA5BWs1ir2AEoqX5xRHNBH5yC0kYaUJp
         3trA==
X-Gm-Message-State: AAQBX9doUrerH+IJjQDsmmJ8hSr+WdlVdu6naJd5KsW2wqIH+bEb1C/b
	Aj/hWb76pchXmb5f0o1upwrYAqDdSMEWjxZCvYM=
X-Google-Smtp-Source: AKy350ao+/7bEok4Abt9/zxZOar007y/ULFW6xkLcjzlu7/jxRV1Ag/ua7DsMXMSEICNjxr3Wld7QUpS6J0Lp/BeZVM=
X-Received: by 2002:a0d:df4a:0:b0:54f:b4fa:3271 with SMTP id
 i71-20020a0ddf4a000000b0054fb4fa3271mr5522576ywe.21.1682238671839; Sun, 23
 Apr 2023 01:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681887790.git.zhoubinbin@loongson.cn> <3b9c4f05eaf14bc3b16aebec3ff84c8a2d52c4a5.1681887790.git.zhoubinbin@loongson.cn>
 <f9b62f48-5c8b-2674-313d-4552c61c4302@linaro.org> <CAMpQs4JjHvVOzQz-1Y-q9ut6tWUpakrHeozuwPg0dzoDcUFEGA@mail.gmail.com>
 <75231886-cdf6-cfde-d6b9-183b1fbf98da@linaro.org>
In-Reply-To: <75231886-cdf6-cfde-d6b9-183b1fbf98da@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 23 Apr 2023 16:30:57 +0800
Message-ID: <CAMpQs4Jp8WPKJEuJD-_83oRPBbPELxS5ufqp-nHow0D9D+R+ig@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: interrupt-controller: Add Loongson EIOINTC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 11:52=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/04/2023 15:00, Binbin Zhou wrote:
> >>> +examples:
> >>> +  - |
> >>> +    eiointc: interrupt-controller@1fe11600 {
> >>> +      compatible =3D "loongson,ls2k0500-eiointc";
> >>> +      reg =3D <0x1fe11600 0x10>,
> >>> +            <0x1fe11700 0x10>,
> >>> +            <0x1fe11800 0x10>,
> >>> +            <0x1fe114c0 0x4>;
> >>
> >> Binding is OK, but are you sure you want to split the address space li=
ke
> >> this? It looks like two address spaces (enable+clear+status should be
> >> one). Are you sure this is correct?
> >>
> > Hi Krzysztof:
> >
> > These registers are all in the range of chip configuration registers,
> > in the case of LS2K0500, which has a base address of 0x1fe10000.
> > However, the individual register addresses are not contiguous with
> > each other, and most are distributed across modules, so I feel that
> > they should be listed in detail as they are used.
>
> Do you want to say that:
> Between 0x1fe11600 and 0x1fe11700 there are EIOINTC registers and other
> (independent) module registers?

No, this section is all EIO-related configuration, but there will be
undefined space here.

Throughout the chip configuration space, there are some relatively
common areas, such as the definition of 0x1fe1_14c0.
Because our chip supports two interrupt modes, node legacy I/O
interrupt and extended I/O interrupt, both modes require interrupt
routing registers.
Their registers are then defined together: the legacy interrupt I/O
start address is 0x1fe1_1400, while the extended I/O interrupt start
address is 0x1fe1_14c0.

Then I have carefully compared the chip configuration space in
LS2K0500 and LS2K2000 and can see that:

1. The chip configuration space base addresses are different, but they
both have a size of 64KB;
2. The offset addresses of the EIO related registers are the same, for
example the offset of the enable register is 0x1600.

Wouldn't it be better to declare the entire configuration space (64KB)
directly in the dts and use the offsets to access the corresponding
registers?

Example:
reg =3D <0x1fe10000 0x10000>.

Thanks.
Binbin

>
> Best regards,
> Krzysztof
