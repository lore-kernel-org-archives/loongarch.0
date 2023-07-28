Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4367C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:46:53 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so2781150e87.3
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 18:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508812; x=1691113612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxKgytFLxzXVyJZBJwebLIhb8nwv4d9rqhg53vYef1Y=;
        b=qgDbTIJf7vNP10O6CyjC7aJa8EbZMGCRFIf9fRH0TWJups1odl5BlgLJKPp9GrPvxB
         p3V0XvmQIOKGLBkVfuE6FhnxK/HOFsWMdi8MAB2woquak0c/9/ZO2mgDlaxfUM2ANO/T
         aMlZjEzAQYwTWKCBeFQ4gVkzcp3FaA3kWsW/nyPOuQmFa+xIigB07msYsic5LHOKiG37
         18Ay/bVKAs9GD5F7Lv3nQsULoB9oUlix2ItLt+ggZsN+zk1VeK3TeEzeCWqxfOyvdhgM
         PwuLJbvVgiXL1XhG4RCGSpo1LQ13hrqSEM79GtRlSfuPH7wzIpN4oaodL7ycna9TUwc9
         qq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508812; x=1691113612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxKgytFLxzXVyJZBJwebLIhb8nwv4d9rqhg53vYef1Y=;
        b=QU8UQipGWzQcMS5+HejPw0BTzWcR7Q0M0Pzpx3dBBkXGpOmaI4f7/UlvudECFlG1zm
         2DrLUYvpp6F/KibpCcVzlVC1ad5t/HainsgtEKtrGvrEsAZ+vQlZCIUChCczh/zx3dwe
         X4TpyUEImRKF9hLWw+f7ttnFe1ymnYUvM5XovQoLjDtudRVzuB6T8grKENIx+qvuZrDN
         NxoF7xnMteTO+n+X+N2LhVnGrJFwX3jVXb4SU/M0F8c/iitOudA8gvcgQbc5yBkQfJ7H
         ziVk89cePPwzc/qWBJW8BLcwqVfAa/2EHwUPUFrn3B3P+PgWWyDUBOWL7tgntzit4ite
         LmtQ==
X-Gm-Message-State: ABy/qLbdoNgTFN3jAy+hhAmipmyofQ8pU9nKoHSDF17y+iA82c7SVkis
	6JcyM5CKunKtdXpKU8iWenDPq5+BnQV14deq81grWrNIlr2Ffg==
X-Google-Smtp-Source: APBJJlGIArvhwpZZCRhnfuAR+rY9ZKw6xESIhjzfTfichxQnRgzkX5C4oTqzLUENfoH0WF2ZMdIfj6L/kML0zMcBB6U=
X-Received: by 2002:a19:ca03:0:b0:4fb:8771:e898 with SMTP id
 a3-20020a19ca03000000b004fb8771e898mr490409lfg.15.1690508811655; Thu, 27 Jul
 2023 18:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <0ec0ae938964697010b3d035b7885e4dda89b012.1690439335.git.chenfeiyang@loongson.cn>
 <38591e4c-c4f1-4b6e-a9fb-57f349735bb0@lunn.ch>
In-Reply-To: <38591e4c-c4f1-4b6e-a9fb-57f349735bb0@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:46:39 +0800
Message-ID: <CACWXhK=mBiD4cBRWixiiPh4UVppLVH-TH5SA1Ab2MrBpQtGmvQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] net: stmmac: dwmac-loongson: Disable flow
 control for GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 6:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Jul 27, 2023 at 03:18:51PM +0800, Feiyang Chen wrote:
> > Loongson GMAC does not support Flow Control featurei. Use
>
> No i in feature.
>

Hi, Andrew,

Sorry for the typo.

Thanks,
Feiyang

>    Andrew
