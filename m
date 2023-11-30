Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D623B197
	for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiNozpPc"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db498e1132bso781844276.2
        for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701349362; x=1701954162; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+XQrviBlIMoJrwg4MwMEzdsSIALeidvNSbX1jKDmG8=;
        b=EiNozpPcAti0vXxYXMncOLCoNMAKh4avAuEdtBdqHUIta4NJl4kwALWuSDc4nfFvJa
         Q7uLvrABuD8yd3/hfb3WGOSfpOEqMfWgmbeACInNv7IQtPqpLCvBc03LJPVTSMGwYy2n
         GN3DTcW9goIhsIYyKwyDMLnGnHkltpntNwA+iAxnoy53hDuCGi+C/PMfUp3jJVhLR+aO
         HpN16qeoz+T+9Y1wngs8HmipFa9HkHwtiROsbDck/2sRZXmYWO4fNBmfR9f9BUayEz+8
         Uu4HVLkhYJvrFTR5RLQOjUJkkK998f/djJR3Oa8LKav0pG2E2I1GGP+3mgbwZwQcF5mL
         WpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701349362; x=1701954162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+XQrviBlIMoJrwg4MwMEzdsSIALeidvNSbX1jKDmG8=;
        b=byceJTZSX+47BLYwEN1v69r7i0xXLhkY7XkJdugkGyU1hQgBhVrlT9pFs+NTUiU6Bi
         ktFBoBEk2DxdJCrRdVv05c/l1yihbAJFMjxuZtOQiqPXIVnqM9kWerylZv40oL9VEZCT
         ugS6x7f1kZvXmRWS77QaARXeR6T6B5YTSlan5QMCFI+u37/oh5qdLBiAuZSpaaA58nWW
         6TsOIjnTy1EuLaeHt+v9Kwx8QjUzpYP3hm7PiYEhSrTggHZBcSeniRRx9mTzGfi231N9
         UCvG8FSi4SsUwKQTpSBJiusKY3NP+Q7TG3zudygqljKBmG5MPeVi44UoEaMN0z8nht1U
         Ux2w==
X-Gm-Message-State: AOJu0Yxd+pQJrWBw110UDzZTtJCS2P6wDeJWnKxBUG5M1PTm/iVXOjko
	alXEhW2zA4y1941OW95ukB8QLfD4YWHLlGkW6D0=
X-Google-Smtp-Source: AGHT+IHIwoQzWS4BMQgwFN+MZ738g0TwywAROWyKKdIPTEdVaVrBaTq/gSSsO5ifNGwIKJT7r35V4rLO/ylbgNI4JiA=
X-Received: by 2002:a25:6853:0:b0:db5:3c1d:76a5 with SMTP id
 d80-20020a256853000000b00db53c1d76a5mr1385840ybc.44.1701349361458; Thu, 30
 Nov 2023 05:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1700449792.git.zhoubinbin@loongson.cn> <cae772aa897f6b10c3f5c4c93a256b50c5de4b21.1700449792.git.zhoubinbin@loongson.cn>
 <20231127182836.GA2150516-robh@kernel.org>
In-Reply-To: <20231127182836.GA2150516-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 30 Nov 2023 19:02:29 +0600
Message-ID: <CAMpQs4LSTV6PgZSuyQx2Nq+87OHxSa=-Wz5nbhFVsmmvHubQFQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: interrupt-controller:
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

On Tue, Nov 28, 2023 at 12:28=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Nov 20, 2023 at 05:06:23PM +0800, Binbin Zhou wrote:
> > Since the 'loongson,parent_int_map' attribute naming is non-standard, w=
e
> > should use 'loongson,parent-int-map' instead.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  .../bindings/interrupt-controller/loongson,liointc.yaml   | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/loongson,liointc.yaml
> > index 00b570c82903..70c125bf8095 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,l=
iointc.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,l=
iointc.yaml
> > @@ -54,7 +54,7 @@ properties:
> >    '#interrupt-cells':
> >      const: 2
> >
> > -  loongson,parent_int_map:
> > +  loongson,parent-int-map:
>
> Not what I said to do. Now you just break the ABI instead of maintaining
> both names.
>
> Just use loongson,parent_int_map *forever*. Drop this patch.

Hi Rob:

Thanks for your reply, and I am very sorry that I may have missed your
previous thought, but at the same time I'm confused about how to
handle the 'parent_int_map' attribute.

During the V2 patchset, krzysztof noticed the non-standard naming of
this property and suggested that we rename 'parent_int_map' in the
binding and label it as "deprecated". But you don't think it's worth
doing that.
My understanding is that it doesn't make sense to keep
'parent_int_map' for the new binding, so I'm just going to rename the
property in this version.
It's true that this will result in an ABI break, but at the same time
corresponding changes have been made to the driver as well as in the
existing DTS{i}:
Patch 4: Handles attribute names in both naming styles;
Patch 5: Replace all 'parent_int_map' in the MIPS DTS{i}.

Do you think this is a suitable way to handle this? Or just keep the "_" na=
ming?

Thanks.
Binbin
>
> Rob
