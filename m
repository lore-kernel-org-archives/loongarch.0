Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729A156C1
	for <loongarch@lists.linux.dev>; Tue, 30 May 2023 09:49:54 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-96f53c06babso758248166b.3
        for <loongarch@lists.linux.dev>; Tue, 30 May 2023 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685440193; x=1688032193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D++kU1nB61eBtycdhje0CGacbkQPrmHYWln6MSMfpxE=;
        b=ebrO0AbiU699M78nj/lkJ6TLK8RtTBThEw1uJZmz6/RBWliG/+CcnbPuvUu6kEudoG
         qR+M4Ylx1cuvkWlA0nbTnG2oa3+SDbvWWTdCV6MPbbq34myN6p9w59Hfle4mnu+FU13w
         mm7ERI6L2lJ/O5Dx/DuLDZzscMzb+vg+K3+1kkWBDRT/RTiq8+Xu1B6ikmc4HxmEAoVL
         D55Z6KwoZU3zk7m47NadZiBEPWWtK5kwxO4VUmfxWoelyXTdcU67ENwMH8CUPQcURzNx
         C/07+xDsnQ3MlUjH/fBNCpPLlA/5Q3TJF5FHIDv7LP7sNUWRw/o7exy2QhpYlbwPi76H
         6cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685440193; x=1688032193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D++kU1nB61eBtycdhje0CGacbkQPrmHYWln6MSMfpxE=;
        b=Wa15tE7zo/G0G63Wu5FeR8fTkIFzL7AwK9cQu4bFIQM6uScUdViAZN5LSgSA12QVPt
         vJVha7Yb3wPq6j5hg/d9saYlUC3DKn+e5Qtk5RLZB+nqlBAsFXyuTz6BYXZWI2HPVlUe
         /iZIsPoI3i0/U1Endms1OMKzfmoG+xh5hg1c4SS8bw+AYkLVayyBpRrHS8IYyMngkKrx
         1ZfjF6yIYDOJRGqK+yymK8100UpbzBffFlqau+k5IBYRRhcjEkVjvatvn8iKliBKR2z6
         243Q42kD00K5qtMcWoUFGbrwOtLRQrx1czOh3XtRG71MUJT1VfQvlDEgM6G0bC0v1xi5
         gHqA==
X-Gm-Message-State: AC+VfDx+NrfncFK36/Xg9k5YNOsuzhmmKI/YK0IvG85ZgqrqH2ySIagT
	qUEMCw18MXEDTzwq/wRBce85zvVu2moNSaRy52s=
X-Google-Smtp-Source: ACHHUZ6b8UI8RWUYgeGBH85JNvUp42kjeJ8QW/vqH7ouLfa3WTiJdMb24oJp719CZUAgB+5nqOZYeLsBvW3/8Um6k6g=
X-Received: by 2002:a17:907:ea6:b0:96f:d154:54f7 with SMTP id
 ho38-20020a1709070ea600b0096fd15454f7mr1750791ejc.42.1685440192524; Tue, 30
 May 2023 02:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud> <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
 <20230527-poet-antarctic-cc02aa60ab52@spud> <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org> <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org> <202305300840203aa4ff4c@mail.local>
 <CAJhJPsXyS_+tTLJ1JSCNx6wXs8eGwwQ4khg=-0gRGZuJRDddoQ@mail.gmail.com> <2023053009220055969681@mail.local>
In-Reply-To: <2023053009220055969681@mail.local>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 30 May 2023 17:49:34 +0800
Message-ID: <CAJhJPsVvdSwzGw=m8cxSPqgp6x=_GNj9vaD4+68Yoj9Rj-kj0Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Conor Dooley <conor@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, zhao zhang <zhzhl555@gmail.com>, 
	Yang Ling <gnaygnil@gmail.com>, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 5:22=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 30/05/2023 17:13:12+0800, Keguang Zhang wrote:
> > On Tue, May 30, 2023 at 4:40=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 30/05/2023 10:17:43+0200, Krzysztof Kozlowski wrote:
> > > > On 29/05/2023 10:31, Binbin Zhou wrote:
> > > > > Hi Krzysztof:
> > > > >
> > > > > Excuse me.
> > > > > We have different opinions on how to better describe rtc-loongson=
 compatible.
> > > > >
> > > > > Based on my previous communication with you, I think we should li=
st
> > > > > all the Socs in the driver and drop the wildcards.
> > > >
> > > > Suggestion was about the bindings. Not in the driver. I never said =
to
> > > > list all compatibles in the driver...
> > > >
> > > > > This should be clearer and more straightforward:
> > > > >
> > > > >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rt=
c_config
> > > > > }, //ls1b soc
> > > > >         { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rt=
c_config
> > > > > }, //ls1c soc
> > > > >         { .compatible =3D "loongson,ls7a-rtc", .data =3D
> > > > > &generic_rtc_config }, //ls7a bridge chip
> > > > >         { .compatible =3D "loongson,ls2k0500-rtc", .data =3D
> > > > > &generic_rtc_config }, // ls2k0500 soc
> > > > >         { .compatible =3D "loongson,ls2k2000-rtc", .data =3D
> > > > > &generic_rtc_config }, // ls2k2000 soc
> > > > >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D
> > > > > &ls2k1000_rtc_config }, // ls2k1000 soc
> > > >
> > > > I would suggest to use fallbacks as suggested by Conor at least for=
 some
> > > > of them. You referred to my previous comments about wildcards.
> > > > Wildcard !=3D fallback.
> > > >
> > > > >
> > > > > And Conor thought it should be rendered using a fallback compatib=
le
> > > > > form based on ".data".
> > > >
> > > > Based on common (compatible) programming model unless you already h=
ave
> > > > clear hardware differences making them incompatible.
> > > >
> > > > >
> > > > >         "loongson,ls1b-rtc"
> > > > >         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > > > >         "loongson,ls7a-rtc"
> > > > >         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > > > >         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
> > > > >         "loonson,ls2k1000-rtc"
> > > > >
> > > > >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rt=
c_config }
> > > > >         { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic=
_rtc_config }
> > > > >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2=
k1000_rtc_config }
> > > > >
> > > > > In this form,  I think it might not be possible to show very
> > > > > graphically which chips are using the driver.
> > > >
> > > > ??? How is it impossible? For all other SoCs and architectures it i=
s
> > > > possible, so what is special for Loongson?
> > > >
> > > > > Also, for example, "ls7a" is a bridge chip, while
> > > > > "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate t=
o
> > > > > integrate them into one item.
> > > >
> > > > Why it is inappropriate? I don't see the issue here... what is a
> > > > "bridge" chip? Isn't this also an SoC?
> > > >
> > > >
> > > > >
> > > > > Which one do you think is more suitable for us?
> > > >
> > > > Use fallbacks for some. You pointed difference in alarm for ls1x, r=
ight?
> > > > If so, then they can stay separate.
> > >
> > > From what I seen the IP and register set is the same, it is just the
> > > integration on the SoC that differs.
> > >
> > Actually, ls1c RTC registers are not the same as ls1b.
> > ls1c doesn't have the following resgisters.
> > +#define TOY_MATCH0_REG         0x34 /* TOY timing interrupt 0 */
> > +#define TOY_MATCH1_REG         0x38 /* TOY timing interrupt 1 */
> > +#define TOY_MATCH2_REG         0x3c /* TOY timing interrupt 2 */
> >
> > +#define RTC_CTRL_REG           0x40 /* TOY and RTC control register */
> > +#define RTC_TRIM_REG           0x60 /* Must be initialized to 0 */
> > +#define RTC_WRITE0_REG         0x64 /* RTC counters value (write-only)=
 */
> > +#define RTC_READ0_REG          0x68 /* RTC counters value (read-only) =
*/
> > +#define RTC_MATCH0_REG         0x6c /* RTC timing interrupt 0 */
> > +#define RTC_MATCH1_REG         0x70 /* RTC timing interrupt 1 */
> > +#define RTC_MATCH2_REG         0x74 /* RTC timing interrupt 2 */
> >
> > As you can see, it doesn't support match function, which is why ls1c
> > doesn't support RTC interrupt.
>
> They are in the Loongson1C Processor User Manual I have which states:
>
> 21.2.6 SYS_TOYMATCH0/1/2 (no register in 1C2)
>
I'm afraid that your user manual is outdated.
The latest 1C300 user manual (v1.5) doesn't have section 21.2.6 at all.
Sorry, I can't find English version.
Here is the Chinese version:
https://www.loongson.cn/uploads/images/2022051616223977135.%E9%BE%99%E8%8A%=
AF1C300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Best regards,

Keguang Zhang
