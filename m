Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A07C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:36:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f954d7309fso1978193e87.1
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508180; x=1691112980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBY4dqR8k6VkxPBBD1QDAVOvsIKWDS67oRxcN+6z7R4=;
        b=OdXU97AfLvUjjWYfRGF8Yq2orD02N8VH5dISv4o2HIBNcxoXWkX0dJWzFa6N+FAxzC
         XB6+d+XSAX88Vzj1vwNT68ObRxmYsUN7wWafRYg9qahGBj6VP8MqcyRus5JFOFvX8VRC
         uVtB2stZhsqBnqSY/tm6xpSV+GkpN5KKQqRC+JBRRokPF54a5T8jnQvyctiahw0d71Qd
         0hQ0GMbCe6UfzOAyxLf99/Z0bEmOyNSGhKot0M+En7SklvlCxQFFjsqz9aM8gnY9hMpz
         FrUQxTHe5OWx9oRUIn1NG9V55JWWMYJ8GG9QPJGdTs+xWzwsrBlaXN159fMJ93JE4y+N
         zPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508180; x=1691112980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBY4dqR8k6VkxPBBD1QDAVOvsIKWDS67oRxcN+6z7R4=;
        b=Ni5jUBzZB/K5nHRcN8ITWH8UcrEgvQNK0wNXE7UTT9YkLpMwS0O9CdX90uSDO4jbVg
         5bYsKo8q5plgrAqD6yZejj5OHv9k1r/0WoZr4xgMHIoqynX1YXdnQZN5txK9tGtA9off
         cUOVV94VGBeXFK6c3Li3VxfmxUnZzlEAzmePa6+CwXMaaskwxyZigIc5FAV8Up+5B7gR
         SN+NpUwiPBZVHHv0VgHqRS7kKBmEZBYSUQrBnsymZCm12KNApRTTSvw5rjhDS+Rm1h+h
         tv8gly/T85Y08EAp1AULYlqWd7vznwPhYjVsypSr1Snrjp2bOZ656nQROdkHoMBb3L0r
         NxjA==
X-Gm-Message-State: ABy/qLa87SRldo/HRxxOFp/P/9RVsQXpZswiMZmekAvXd323zq1bj9f2
	6o5cMaK1mL0oHJGxTwaRUigQn/Jtv9MJ9rU5keI=
X-Google-Smtp-Source: APBJJlHgwB5gToyjMVHyY8YGLO7HADwdYYX5FTUcl+sxURYeMOlncTnSwDZJa6Zi/Zx1j8hiJcxH6uvOGCgmmHey1cw=
X-Received: by 2002:ac2:5055:0:b0:4f9:dac6:2f3d with SMTP id
 a21-20020ac25055000000b004f9dac62f3dmr345770lfm.13.1690508180156; Thu, 27 Jul
 2023 18:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <DM4PR12MB50880AA9F0C93F86B0A7A308D301A@DM4PR12MB5088.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB50880AA9F0C93F86B0A7A308D301A@DM4PR12MB5088.namprd12.prod.outlook.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:36:08 +0800
Message-ID: <CACWXhK=qGZA=_5PyTpjfdUmtBabtYo7eammoeX87y6vQ+B3NQw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] stmmac: Add Loongson platform support
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, "andrew@lunn.ch" <andrew@lunn.ch>, 
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, 
	"chenhuacai@loongson.cn" <chenhuacai@loongson.cn>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"dongbiao@loongson.cn" <dongbiao@loongson.cn>, 
	"loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 5:02=E2=80=AFPM Jose Abreu <Jose.Abreu@synopsys.com=
> wrote:
>
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> Date: Thu, Jul 27, 2023 at 08:15:44
>
> > Extend stmmac functions and macros for Loongson DWMAC.
> > Add LS7A support for dwmac_loongson.
> >
> > Feiyang Chen (10):
> >   net: stmmac: Pass stmmac_priv and chan in some callbacks
> >   net: stmmac: dwmac1000: Allow platforms to choose some register
> >     offsets
> >   net: stmmac: dwmac1000: Add multi-channel support
> >   net: stmmac: dwmac1000: Add 64-bit DMA support
> >   net: stmmac: dwmac1000: Add Loongson register definitions
> >   net: stmmac: Add Loongson HWIF entry
> >   net: stmmac: dwmac-loongson: Add LS7A support
> >   net: stmmac: dwmac-loongson: Disable flow control for GMAC
> >   net: stmmac: dwmac-loongson: Add 64-bit DMA and multi-vector support
> >   net: stmmac: dwmac-loongson: Add GNET support
>
> I took a quick look at your patches and I'm thinking whether this is the =
correct way to go.
> You are mixing up the stmmac generic layer by adding the Loongson HWIF en=
try.
> The whole idea of HWIF was to have it independent of vendor specific logi=
c.
>
> Can you devise another alternative without mixing up the HWIF?
>

Hi, Jose,

OK, I will try.

Thanks,
Feiyang

> Thanks,
> Jose
