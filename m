Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE77C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:41:31 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so2803835e87.0
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508490; x=1691113290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQZDst5qjaEpnNLHre25dv9hzF5f2KbCPvv3bZhdA8M=;
        b=E7GwpTEiXCWXp8CvDlE/e2MFibkDirRGzggEgGqz3YZAxhOwVJtb//aXRVjKhWoB8v
         sJSqiihV23CXLrIF1uwXmf/MjUJKpPyqH3wunQUCjYi7w/8rRBcaTZ/tTQXf77uBzNfg
         EqadLhb04SWm07uyZ0hE/O7rZO8oqe9azO5t81v+QOLLBiqrngZXYX3xJeiUfLzD4y/Y
         8K/C+IBGfYWitjWeUy/IB2Ng/tuLIVjGrvrmJ0sqf6lm3helPmB1CIMn+p9xdJe+W87F
         WsY/Uhi623LB8Gh3VT5nw2mjw9GjvbjvQVpme/LS6Brl0+YaKVJ/ZgxW6pRllr4nGKHi
         AzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508490; x=1691113290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQZDst5qjaEpnNLHre25dv9hzF5f2KbCPvv3bZhdA8M=;
        b=Hl7CAI49CN4DxUJsVCd6ErDRi8MzMvqjXRXlD46U5ETrxsdgjNFfOIL/of+agYOCV0
         H+LrCacYiL8pSiFgN5j+5m5ol3TbGVmWL2av/vQcADXBgA2LSRPld91vcLU8Q4/xxFQh
         0ets5PYKUeFQiKlpIyslLD3m+mdwRZwG6d2DKN1qDcxSqbXs+l6eb8i7hc2ubI+drB/w
         A7QQNlE7m3ntGBLw5wOvk+GWu7hQsDO4b3//wa0leYOUR4pwQL1C1UfKCqoWrGueJP/H
         WS8oT17ITL00N9xCCqML2DR02SMXIwAP5KreXWlXrT+VU2kYV93PQaPW2ijgr01zGg1E
         7X+w==
X-Gm-Message-State: ABy/qLaHEgFiCbj4wPi+BYwY0aCTAz9ZZrNqM0oIxUNCRGAb64zBPGhJ
	fcgHVpoEaODOrnWQx6izRqUa0vWjliOe8wIpig4=
X-Google-Smtp-Source: APBJJlFuNSIT3DQIyoCdYBI8pbyqFOvtpvPqQAWD6q9xtgQtJXnh9HSdLOVh99FsJVU3EiolsIwUz+APhic3TrJzcYo=
X-Received: by 2002:a05:6512:541:b0:4f9:cd02:4aec with SMTP id
 h1-20020a056512054100b004f9cd024aecmr525694lfl.29.1690508489684; Thu, 27 Jul
 2023 18:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <067f87d9785849c13f2f8733d457ffe8616a1aa0.1690439335.git.chenfeiyang@loongson.cn>
 <5b52d461-77e5-493a-a634-4c8a0637a0bc@lunn.ch>
In-Reply-To: <5b52d461-77e5-493a-a634-4c8a0637a0bc@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:41:18 +0800
Message-ID: <CACWXhKnqkjS7mG0N-=Htt1Ee8xTmb3EYfAOJpFta7C0076advQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] net: stmmac: dwmac1000: Allow platforms to
 choose some register offsets
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 5:10=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +#define _REGS                        (priv->plat->dwmac_regs)
> >
> > -/* Rx watchdog register */
> > +/* DMA CRS Control and Status Register Mapping */
> > +#define DMA_CHAN_OFFSET              (_REGS->addrs->chan_offset)
>
> It is thought to be bad practice for a macro to access things not
> passed to it. Please try to make a cleaner solution.
>

Hi, Andrew,

OK. I will try.

Thanks,
Feiyang

>        Andrew
