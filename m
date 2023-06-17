Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071833FD
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 06:54:05 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-570282233ceso17233817b3.1
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686984845; x=1689576845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdtV/MXVNsTYrKqOmSjIMz7q9/avU6No9O79dlPLg4o=;
        b=lWN8KQGCQp2fyzA6niAu9qi8qPkMR9Uo5N9XH3SSbZEk3HdnpSJel1WD0QN8ey5gNg
         XnqaZMzIaYscPYWOdwa6XyT5oS7zimjPTHF+9LHBa4aAZl47FTNHiKp+6bBN835epOVI
         Usv7EdKuhTr3q3oMEE2rLc2Ox0RbRfA8kisFZFuW9DgLRjdEGJblK13RvKaKGJ8FOGPf
         R8syVmiGUb3VJrSA0i3mSL7OQ3i/RKVOa2DiJx6RpIsbkbg475qhBK+lSVPFNs8WQfqw
         NTGgnwCMfIaPf4+aoxLOAHf2SXTiWu8ryQlkMRsGNxTbf74MaRLEZQcxtMIOPiW6sk55
         Om+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686984845; x=1689576845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdtV/MXVNsTYrKqOmSjIMz7q9/avU6No9O79dlPLg4o=;
        b=bzfRLW3Df7Rk3CNBFIpOvKBWLbFnBkheTJFrxODhmnLqBjXjU2n8RYItti0EcN9kyD
         VAcCx2JGvh295IdLyAqs9uu4Pe7zNUM2+GB5xCnD2nEzD2UNstHlGHZgVwINfNJEDNb3
         EYK7Rwy4cz3Ksqv5C//Rgrq1jSxs7xAp1ZqTRDzStuSEof67r0P+Z3COAhtuovXyIM9F
         TJUxSg3Sjbk7dqF3e3EnJdKA2vjY7xeYEEW58SHXNz0AdH2nD2sXeR1bckTWot7JGGGj
         G7/5ZjxlvOIQjf+QfM9olDjmQ6XfQXpVcJX9nRB1eu0smNFpnJ0TZLh0XECCs33rWnSc
         kktg==
X-Gm-Message-State: AC+VfDwhzUwPfzf4JMkKOb+C1qBH2vDaWo4SAG16mYgoQ7F8XxeH8t6m
	F+qblbicKdFuAHHcbWZQZq2x0+laxW7bQsnfzzE=
X-Google-Smtp-Source: ACHHUZ52sw3ie38tAu1fFwsmlJYcRFNJjls5PAh3xu5TxqVpHPRBgDpjVFAqNCW/gheSeJedLOJTsqo+Q22ilJucSLI=
X-Received: by 2002:a81:7584:0:b0:56d:6c9:d82d with SMTP id
 q126-20020a817584000000b0056d06c9d82dmr3965778ywc.21.1686984844879; Fri, 16
 Jun 2023 23:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686882123.git.zhoubinbin@loongson.cn> <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
 <20230616-projector-visible-4135a378fb56@wendy>
In-Reply-To: <20230616-projector-visible-4135a378fb56@wendy>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 17 Jun 2023 14:53:53 +0800
Message-ID: <CAMpQs4K38C3URsBQ6YC0km5Fg21o4VuEqOe=f6emeutdoqKf_A@mail.gmail.com>
Subject: Re: [PATCH 5/6] LoongArch: DeviceTree for Loongson-2K1000
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 5:48=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, Jun 16, 2023 at 02:11:31PM +0800, Binbin Zhou wrote:
>
> > +     memalloc@0 {
> > +             compatible =3D "loongson,ls-memalloc";
> > +             reg =3D <0 0x90000000 0 0x20000000>;
> > +     };
>
> This is not documented.

Hi Conor:

Sorry, this is my mistake, a private driver will use it, I will try to
remove it in the next version.

>
> > +             gpio0: gpio@1fe00500 {
> > +                     compatible =3D "loongson,ls2k-gpio", "syscon";
>
> This isn't valid either, the binding doesn't allow syscon?

The syscon is not needed right now. I will remove it.

>
> > +                     ethernet@3,1 {
> > +                             compatible =3D "pci0014,7a03.0",
> > +                                          "pci0014,7a03",
> > +                                          "pciclass,020000",
> > +                                          "pciclass,0200",
> > +                                          "loongson, pci-gmac";
>
> None of the compatibles from here on out are documented either.

These are required to be added according to DeviceTree Spec PCI [1],
Linux does not use these compatible for now.
Removing them really doesn't affect the driver, but to follow the spec
and make sure every node has a compatible, I've left them all in.

Are they not required?

[1]: https://www.openfirmware.info/data/docs/bus.pci.pdf

Thanks.
Binbin

>
> Cheers,
> Conor.
