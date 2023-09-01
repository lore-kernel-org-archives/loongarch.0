Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E69A921
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 09:27:41 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bb07d274feso1356299a34.0
        for <loongarch@lists.linux.dev>; Fri, 01 Sep 2023 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693560460; x=1694165260; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNejtY2CYRQHuWNnMRsL970fJ2LcYenjaMg4E67qwZg=;
        b=NACfG3k4afBvtlj64pyu8i18B5V3u7o14x69XyX7v9ofN9hUuFiOuh3hj35HJh8cJI
         kYlRY51YvI9iswGMjKzyvf8zDujvHTIJkCM73AsQh12m/a2M9d1dV//SXOHk08klLHCd
         zywXai2+D74ZDFGmxCQCJYUzv3McrqOpiy3sOZvZqKrcLm807t6fEMKBH84uPYj75Sg8
         bJ8SZhOZUkZVR1WAa3DHImBEc4+mkMZFoYyN6d4rs6GfnEBNWiLV+5P7m03z3O/YYslY
         O1Cuf6MMbMa5wkrGGpV6Gi3VWEYBra7R5WQuFIyEcWiPtqRcUsCMEt7J4obTM6SIW5Ri
         Fd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693560460; x=1694165260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNejtY2CYRQHuWNnMRsL970fJ2LcYenjaMg4E67qwZg=;
        b=VF+v0Xz3XiHknsFcLJqQXinqn2bZJQXYwhBpB6qMini2haIyhy3zsvZO3tccKyhChK
         5R8lVstfR5NjUzm61w3SD66WVeBHdnOysvkclzSB1DT6UYjfU7AktuVp/1gz4a/0l+nn
         hUf06hqXAkCOyxpdCg9iZzm1c5EV7C9RjBULUd1TgP4Oneo1V2/Gl0x9HglKD2aWubel
         lvoJ/vfXCy/99SBLzk038/5vy8k+Ck4Ifle89MZ2446JyUemJqGuYLkMcYtG17hngJWL
         rvR40Mio84a/xyiMIdGHcaCL7DuBffbvmp/mMYWBFkQU+zRGBMCkpYRZtQ8s7J3MJKyH
         zLvQ==
X-Gm-Message-State: AOJu0YwfT+mq6dvU3eJ+AbFL8n4OC7XKtFgH2pjPoUElWDmE7Y9Qkn9h
	TFVDc+5XsWFxugUJXHCr7ne0tGLVcsANqxWz39a8fmnUL8Q/X5fX
X-Google-Smtp-Source: AGHT+IHGcKLODahchCBBvFixtlLSYCgY2KNa3x1lSet1wv+1MdRrmY04593geKiUioPkoJbLl9x3eu52b/hIFO0+TyY=
X-Received: by 2002:a05:6358:342a:b0:133:428:35dc with SMTP id
 h42-20020a056358342a00b00133042835dcmr1444953rwd.11.1693560460156; Fri, 01
 Sep 2023 02:27:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1693474728.git.zhoubinbin@loongson.cn> <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
 <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
In-Reply-To: <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 1 Sep 2023 17:27:28 +0800
Message-ID: <CAMpQs4Jrvd=KAXUBYYdixvvhBx1hAXxECUhGVsuEED1Jp9SPDA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow
 syscon-reboot/syscon-poweroff as child
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:


On Fri, Sep 1, 2023 at 5:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/08/2023 13:43, Binbin Zhou wrote:
> >  required:
> >    - compatible
> >    - reg
> > @@ -54,4 +66,18 @@ examples:
> >          interrupt-parent =3D <&liointc1>;
> >          interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >          loongson,suspend-address =3D <0x0 0x1c000500>;
> > +
> > +        syscon-reboot {
> > +            compatible =3D "syscon-reboot";
> > +            offset =3D <0x30>;
> > +            mask =3D <0x1>;
> > +        };
> > +
> > +        syscon-poweroff {
> > +            compatible =3D "syscon-poweroff";
> > +            regmap =3D <&pmc>;
>
> ???

I did notice that commit [1] changed "regmap" to "unrequired" for
"syscon-reboot", but "syscon-poweroff" did not do the same.
So, at least under the current "syscon-poweroff" rule, "regmap" is "require=
d".

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/power/reset/syscon-poweroff.yaml?h=3Dv6.5#n4=
1

I had my doubts before, but seeing that some dts do have
"syscon-poweroff" as a separate node, I assumed there was a
difference.

commit[1]: 2140d68d69d4 dt-bindings: power: reset: Unrequired regmap
property in syscon-reboot node

Thanks.
Binbin
>
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
> Thank you.
>
> Best regards,
> Krzysztof
>
