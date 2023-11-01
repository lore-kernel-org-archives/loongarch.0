Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7195A35
	for <loongarch@lists.linux.dev>; Wed,  1 Nov 2023 01:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHKCGRGt"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d9a398f411fso5783936276.3
        for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 18:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698803659; x=1699408459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xndyojUWSZZS6wC+L3oMlDNJUSHBHtUd/985yNA14M=;
        b=QHKCGRGtIcnB2WzJcwY9GXDCsCs8a2LN96+vhxMLUUCa6Q/lEkUfrMFi1jLLQ8V7b5
         ts4Xc40HhcmXlup5NAaLYl7oyVAR+j/keYUHbeQDX5RNfid9TVq7TiKrjnF3UK6xVR2+
         DWclMhM8xHtoNq4+rOSeXx4bJFTsI4xNlXsXqTOC3giZLkfnN4V1F4WN0xsJ3gUWsfdo
         IN0zmqElqdSbtThYdnYw+DIE6J9eSuJQ+IR3XseFWK9Xsi0150C/eMWhXQENNo/y7LNA
         zXUxqD53PUaYoa0jT7nKjXHDMAC0dsttEFKL8yU0103U/K6ylpc9uaIzkcVb21w5ElR+
         H0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698803659; x=1699408459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xndyojUWSZZS6wC+L3oMlDNJUSHBHtUd/985yNA14M=;
        b=ZUx3h6mG2MmkbQJkOzSRRn4WH8/ydVKMT1rpHKsRuDs2W5t+Dua/PRNGKDAQkN6JUl
         RJyDZyQQWxPbB4R+Q6EbraSCsDQhtOcuy7PjQBw4FoT4QyoP8ud4X07w0ua/ulr+RLAl
         bTKymYgxYHkv1PrPFNDD6T/BDEOYp3F6YRCr307XQFE3oP3b5nqC3l1yv61e+Aimpsjb
         bLIri3sNwrkPDGrrHmwjKPLlOdsiRCYfkxo8yWrNe4LdcOADLIFPR02NSIyhUvZZlJ5w
         catCkhkAyGJHebaj5Ns4ll3A8sqiQkdw/W4MAy07aB/LMKIHJIwtcBgQAMOSqsuxc3XE
         +Mgw==
X-Gm-Message-State: AOJu0Yw7epIWEvIAkR0XvceVUAp6krmTr5+/3iB9h/P2WxYc4E5MPeif
	3vPe6Pon5I0qEGjO99bxgAUz5CLm1LfcIFoyX+0=
X-Google-Smtp-Source: AGHT+IGsOuzuHAt1UYOEC9rTH1lEADAwKcru0j0aIocj5HwKzJf8KIsocB0CQEcrqCjW62HvM1bbKDi6S0/YDbKSQNk=
X-Received: by 2002:a25:8287:0:b0:d9a:f666:b68e with SMTP id
 r7-20020a258287000000b00d9af666b68emr13529776ybk.30.1698803659588; Tue, 31
 Oct 2023 18:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1698717154.git.zhoubinbin@loongson.cn> <dc6621dd09b4710c66140b830d0b345682c7b707.1698717154.git.zhoubinbin@loongson.cn>
 <20231031175055.GA1801059-robh@kernel.org>
In-Reply-To: <20231031175055.GA1801059-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 1 Nov 2023 07:54:08 +0600
Message-ID: <CAMpQs4JeTvNRv0Jg+-HAeKD4S0GEm5j0ReCjRVYAneUsqqPtOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: interrupt-controller:
 loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, 
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 11:50=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Oct 31, 2023 at 10:36:36AM +0800, Binbin Zhou wrote:
> > Since the 'loongson,parent_int_map' attribute naming is non-standard, w=
e
> > should use 'loongson,parent-int-map' instead.
> > Also, 'loongson,parent_int_map' should be marked as deprecated.
>
> While yes, '-' is preferred over '_', I don't think it is worth carrying
> support (here and in the kernel) for both.

Hi Rob:

We try to keep it compatible as the MIPS Loongson has been using this
property for a long time.
Krzysztof also thinks it is required.

Thanks.
Binbin
>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../interrupt-controller/loongson,liointc.yaml    | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
