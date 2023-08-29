Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337B7FF
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 02:15:45 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58fc4eaa04fso45410477b3.0
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 19:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693275344; x=1693880144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97srBsNV6oTrIvKBviaQ5sS5qJluzTDai93bJAqC3xc=;
        b=CjfX2IRlNx5394bDi7rz+7QpV9VWWGB1DtyK+uN95y5wzfJNWfoGL7aq62qjK8P7I6
         +gS3KzL6HehcW4vSN+OY69pr3NRCiCJCt04Aj8+w5aPSYqm3wX9nbtYoTJAQ82RIus+i
         C56wU7U3xCmn7iiuGo6bRV5hidabNFptuXT65RwtEZU+12H03ygGf1jWqiQgyzrlK5bq
         98wYhrK9g1XxlQIroqqDSX+Sygk0Xjgyzxf74Grl1rOWul3BkR4TV0lKJY3MegRDZSzQ
         Egeeqm8cWEW0sPwlD6qUPDoanqdq8KnOqbz+G7V1Yn1o+rgzJ/oxFlVBUavbSoxp41ZQ
         jqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693275344; x=1693880144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97srBsNV6oTrIvKBviaQ5sS5qJluzTDai93bJAqC3xc=;
        b=RaQmtisw7U0cviwGEnKJ2N/VMX9MMbX5yd0qVWzGscff1xV2ItBsqGyumUaZwrxVoq
         twy134H4uYWZHriutv489gBmcSEpiJYQQGxtQPSD9y3ao9BSeXTft3swa+ET8bjoF9fA
         SBtXKoN67CF/2WaGTYfIbE94ShXzZdi7Q4vLNbXzY7hsqpd/pVhxJ0WJKNnA6skK8RcW
         34OLUqA/XLx1OqJYYeHERmU1rcgsAbE2Oc+MveZKAa4+PTfIJpJEUp1wqKyOoqN6icM8
         eh4N63O8RASO+0pOj2YJppFkg/3oPoLJ5Zqt+NuU4Qd64I4IyvBe/QTYb3zWdGcsum+O
         +70g==
X-Gm-Message-State: AOJu0YyIsgrl/bsO8yowD5wa+SShbyMmJ4thbfLWvkZfiHNNZP4vDb0x
	+Lx7TCPiZcEet4DrT/IABWC1yyGq+/SkQFGuxcU=
X-Google-Smtp-Source: AGHT+IGKUHiiGwHxPNHo2fHKNZYJMJ1G7S9OpNgtuN5xsv5YUPl+cpDee1drXnh3czmUXCFMI7zeKCYkBj0y43qin3g=
X-Received: by 2002:a0d:f585:0:b0:589:f7ad:7702 with SMTP id
 e127-20020a0df585000000b00589f7ad7702mr29701494ywf.36.1693275344686; Mon, 28
 Aug 2023 19:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1693218539.git.zhoubinbin@loongson.cn> <2bec39b1001732de60c1521d78e44a45ff94d6b6.1693218539.git.zhoubinbin@loongson.cn>
 <18b8b8b8-7f42-8e8c-1bfd-36d04eba7c40@linaro.org>
In-Reply-To: <18b8b8b8-7f42-8e8c-1bfd-36d04eba7c40@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 29 Aug 2023 10:15:32 +0800
Message-ID: <CAMpQs4+X+e301CHkrtDQj9A=nTxUFQJPOuqJnPc+ViDcNZBgDQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow
 syscon-reboot/syscon-poweroff as child
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your reply.

On Tue, Aug 29, 2023 at 1:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/08/2023 14:38, Binbin Zhou wrote:
> > The reboot and poweroff features are actually part of the Power
> > Management Unit system controller, thus allow them as its children,
> > instead of specifying as separate device nodes with syscon phandle.
> >
>
> >  required:
> >    - compatible
> >    - reg
> > @@ -44,10 +56,25 @@ examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/irq.h>
> >
> > -    power-management@1fe27000 {
> > +    pmc: power-management@1fe27000 {
>
> Drop the label.
OK...
>
> >          compatible =3D "loongson,ls2k1000-pmc", "syscon";
> >          reg =3D <0x1fe27000 0x58>;
> >          interrupt-parent =3D <&liointc1>;
> >          interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >          loongson,suspend-address =3D <0x0 0x1c000500>;
> > +
> > +        syscon-reboot {
> > +            compatible =3D"syscon-reboot";
> > +            regmap =3D <&pmc>;
>
> No, why? It does not make much sense and is deprecated.

Oh, sorry, I should have been more careful, I'll delete it.
>
> > +            offset =3D <0x30>;
> > +            mask =3D <0x1>;
> > +        };
> > +
> > +        syscon-poweroff {
> > +            compatible =3D"syscon-poweroff";
>
> Missing space.
I will fix it.

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
