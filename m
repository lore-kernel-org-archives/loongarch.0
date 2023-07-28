Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538087C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:47:53 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe0e23a4b1so2778898e87.3
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508871; x=1691113671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFfPfZwjc+uNvV8mG9hFOuvKMgIeKkyutm2C1XzBtLY=;
        b=HhuHcn6qYkMczeFbXyfGSN2yiGRIl02nrEuDfHYX0NIq2cz/I+mnzLPyBd3AvBjueJ
         Mgkf+LPvXQzPC8+7ohkctiq8AkHzeuXKDaIUIHJUzEdBkz55OauhHD2kgDIsfdEyvV1A
         uWHz4S6Yl2noHFvpYVlN76lWWRR869xgIHLZk6pbiZZoeoQyS1og7eI8M7Ghv9CCMAn/
         Jfl8pwe2d/ARmD5AZcryaL3nPKpbBiSt37Cvnu1PqpI6fWohHNmVdG51/tcF4YqPuRH8
         4BlbqZ7QBCfI+30ekZus/wKxGW9VMj4qeAVjTXm3obvvrdnNYd8lMPZdpdSSRRx4KBii
         zznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508871; x=1691113671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFfPfZwjc+uNvV8mG9hFOuvKMgIeKkyutm2C1XzBtLY=;
        b=D2VnbgVGxeb2leu2waOpeS8q8/MC7k+nSglWYeZ4hDE1dRXh+RQxog+E05iYVLZDFU
         AYUTbKuTqskaQOSAGK+oC9bLNu5AcuRQjlsU2HjLv9MUU4HKQ8iiXNi3plyva5mdBmSq
         s7Hm/9MWdipqE8G0/dcUH/SZjR15AykigYvJ0ycs1ERKQ/mopSLgzgawRFmmHzblAwBt
         k42W6p0CpNS77FuS7P1JpUxwiTgEiXTiZFpO22jfIzeX1dJzb21blpoa4ncXH4O9XWSZ
         bVhopGGaM1SuosRajpmxRSGIAvzr9uYrRhE8VnCpkCwJ4ZNh2OGOJk/JHo1lkRfr0vD2
         8mQQ==
X-Gm-Message-State: ABy/qLZM9ufE09Yku347aRZCK/GcfcdWXoeKyuEUC5x0GHXcR6gkeI20
	bUh7sIgh62KgRsg0MLCp190H3jq56KzAq/UMhMI=
X-Google-Smtp-Source: APBJJlHZLbfjtYt0jmpSXISpjxl6oHIS7lr8GkyxK+CeCjm4AxDxmWLTcX0GdHKCKmuz+ioA7/gdeojbKQADmnSz/2I=
X-Received: by 2002:a05:6512:444:b0:4fb:61ea:95dc with SMTP id
 y4-20020a056512044400b004fb61ea95dcmr582572lfk.7.1690508871000; Thu, 27 Jul
 2023 18:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <20aa37fdfd4b03b9614befe1c8f78ffc0ac5dead.1690439335.git.chenfeiyang@loongson.cn>
 <4a59ba65-a4f2-4cd1-8bfe-2ae3e4d0a778@lunn.ch>
In-Reply-To: <4a59ba65-a4f2-4cd1-8bfe-2ae3e4d0a778@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:47:38 +0800
Message-ID: <CACWXhK=-52i75jR6t6avFrEH+SFGKG4k6zXE5_59_av7nAQN0w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] net: stmmac: dwmac-loongson: Add GNET support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 6:43=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
> > +{
> > +     struct net_device *ndev =3D (struct net_device *)(*(unsigned long=
 *)priv);
>
> priv is a void *, so you don't need any casts.
>

Hi, Andrew,

OK.

Thanks,
Feiyang

>      Andrew
