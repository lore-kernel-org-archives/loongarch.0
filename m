Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDDA62D
	for <loongarch@lists.linux.dev>; Mon, 29 May 2023 03:00:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96fab30d1e1so599810066b.0
        for <loongarch@lists.linux.dev>; Sun, 28 May 2023 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685329214; x=1687921214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnwCDU/T0dIgwtC1BckdG+1O/GRZHwgSBiHqZjkeZY0=;
        b=DHutnTQgsS/VW4QNKEqWBXu31AcnEMJlOLXo4uu32E9qQe5Ta1xW8sW7EW8BAdzNKD
         FxCYP/gKb1tw+8b+w+vO+plLSnLcI4GQ42pBE34z2+DXSwaXslTmjsqjrBXGEfHeJYtL
         nRcxwuFuGt7JIgC88ZxriwIwKCI3d2rpr5BMkLh5yQhYWr7NHCfkbfYkvk3pBClfb0FT
         GQzwvklLlCiVX/YPLoAXzLhuDrutM1KbTd2bv9/NJxdC4BBqQymOIANQLkMP3sCUywaP
         UTIlgveLuOW56214lTZFq151Kd/mVGY3B4nSvVN1j0FiRaFPM8khKhZupda2wPUl0PZQ
         GTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685329214; x=1687921214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnwCDU/T0dIgwtC1BckdG+1O/GRZHwgSBiHqZjkeZY0=;
        b=YY4vvVNIMktHA/Zzk4FSfEyhbIZngUy3hZh5dYnouQ3s2zINozWKXJ0jaTLivcUQWo
         zKzg/6keZ2VHEQBcarU4aSag1Dd7Xqd3g6BdunHy6roDi3qciT2RpelWb/SvbVMX99nA
         D6gvUgd9Yk8zQjioANbf+RUyP/WBxxpw/1TGIx8RSRyXrZJaSf/b2fIE/rSF4DGGZ5He
         /+5GVYZnGjP3jq5xTeLlKH04r+vh1cGCCP29GF2SBsn5q4/Hg+nGbBU/lIUwY5lEAVXJ
         egg4dlG1iI9ELyECtfR5FW+JYVyg9Ym33iqibdiDAqa5Nr8TiyoXZdwNwESmcMKM/TAy
         F6zw==
X-Gm-Message-State: AC+VfDxxeaEV/meTguOe2qYUhIqbXS52egFWHkYZlFB/a0o0HjTccH+R
	7tTHyPYm+6ZF2doGVKRsOv6empFdEC5OUoM2hag=
X-Google-Smtp-Source: ACHHUZ41+qkZF5JJGOKotRickXAjiArq6Xp1CoMDAreNbe/oiNtC8e9tF2SAa/F/Vlh80jWpuKSBQnIXY7WdeJB1uj8=
X-Received: by 2002:a17:907:720c:b0:965:ae3a:52c8 with SMTP id
 dr12-20020a170907720c00b00965ae3a52c8mr5673819ejc.32.1685329213609; Sun, 28
 May 2023 20:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
In-Reply-To: <20230527-poet-antarctic-cc02aa60ab52@spud>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 29 May 2023 10:59:57 +0800
Message-ID: <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To: Conor Dooley <conor@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, zhao zhang <zhzhl555@gmail.com>, 
	Yang Ling <gnaygnil@gmail.com>, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 28, 2023 at 6:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> > > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley <conor@=
kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
>
> > >> My recommendation is leaving compatible string as is.
> > >
> > > "as is" meaning "as it is right now in Linus' tree", or "as it is in
> > > this patch"?
> >
> > Ah sorry I meant in this patch.
> >
> > Since there won=E2=80=99t be any new ls1x chip that will boot Linux any=
 time soon (due to
> > Loongson move away from MIPS but LoongArch32 is undefined for now), and
> > rest compatible strings are wide enough to cover their family, I think =
the present
> > compatible strings in this patch describes hardware best.
>
> I don't see why new bindings being written for old hardware should someho=
w
> be treated differently than new bindings for new hardware.

Let me add that ls1b RTC and ls1c RTC are not exactly the same.
The former supports RTC interrupt, while the latter does not.
So my suggestion is to leave the compatible string as it is in this patch.

--=20
Best regards,

Keguang Zhang
