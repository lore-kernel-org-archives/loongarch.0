Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F23A6F1A
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068284; cv=pass; b=KMQzEFtKw7W7z09LDf1Yy8+TkTGVgdKuQ/4z7gFyo6IxbViDqq9Nr0G2hMqRpZNL7gDellHOa4U1tPh9K1k3fqiOt5SZ93eJyfZYs5McKiEmNwFaG5anCzhluHTO2aScOxFP2S24Ue/bhtoNNxkAGCZIHMR1QgkJmchZmHWT1AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068284; c=relaxed/simple;
	bh=Kr7oDKdU55g5UujuqnKWNs4YuX6K9H43zs6YbbtsyO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t44MzWyBDFXBDA+G1NQMqRm2ZysRVG9SFFiiwk3wwC9Ez9QB0l5AoQR7CeZfJsKz6v889vbZuBjgJ3B/FLDpjzRKXhb0ggzMqnQMgUnBcdC8t1pbcBeusCG63AH5eoyuUQC8/7FHqSgzSINFXTjYYQJBfRanMxN26nHQmBwh2PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJAj58oV; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJAj58oV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so556367066b.1
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 01:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776068280; cv=none;
        d=google.com; s=arc-20240605;
        b=jUh/ibanLrpzhG2MbVrVwv59MH5lqdNJ8jhVi89Penmz/1ywX7LIdn1WNGgqCLkLbJ
         2I1n7O4eRffnxQ+7TqC5f6s3ieT6LzdKDDFovMAxhaMCpwm8z8hkGT3fP/hor1lqDTep
         n8KmQ8tMEZ6zYaN2Yr7AyZHsEQbavcdD4I3e5hgE4K+skTMmodo+0JxHC9ZSdMdYlX0f
         Sl7Oxm2iVQadhfFEAlYLdeeG0dOsi461CRJEe4zBc8IZLFxUehQT858Zq+PKE1QPgXi4
         K+cgJ6WVYisF2mFjFFz+pq9/inSnLvX5yOxayJLpygsDvR8dvXFB4Lk1Q8VCN5+wj6NG
         tEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKKtC3Qnmy/nhNGVLZ07dvj7VhPVzyQUkTlW6PGzNKw=;
        fh=lP/4J8yjOBKZi8RJMI99Mhw2YM9W0u1mYgf/WXwpQ90=;
        b=b3Nl3BdiAUGAmqVbn7RKAmYw/YbxTLLKuo+oqan8ojGkurLcnfxh5D2xkWBRjGA/fs
         OIiN99iLN/xkKX5Dw7Bm0snFCCCnHnfs9kQHSWdcK9fFN7GpR3uA6ER6WhaaG/y8wAcp
         eVdNoiV0e23pCThZ5ZIxCLLBPCR5kHJ8mqEjtSIqxuZB86h48sPcFycZznyXRY7kWfXh
         AZIaSNQCzsY1k1GMouqb/S4o2jHyCipDsCLskmJCUaX4KCAMz2jmRoHhbgrOjhumufHj
         8uxsrvg8hk4gBqWCTHgT1aaAeWf//jZM1Lr/IrHJJ9oua9OR1r8yugP22V8TDWNmpInp
         iS0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776068280; x=1776673080; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKKtC3Qnmy/nhNGVLZ07dvj7VhPVzyQUkTlW6PGzNKw=;
        b=OJAj58oV9TSprPA8SFJ3aeFuLr1vIFnsWCain/g1x2rPwP2m1hGxhl+EUsClxDmGtC
         RtjFNWkd6OC+qgDUOfrtKwiC18UoUEvkKFVNP4LutJki2YduBRC7FO/YaCLWTO8uYXkJ
         I+8SlqnQDda+z2DcdhS6CSiEUjUkrrbvv60LWp9ut+a1GUk5GgTsNSGbFcF4arxJh9OD
         SgP4q8uoAFqK9HBjq++FNQpOCnHW1//+kTTSN3P/Ne9Vce4EkkFXvw+vAUlrU/wIY1JE
         WCzWcrAihgptZ7968VZ1+CngRagcNpWWNmywt0HAKDKQxuejYg9hcAJo2zvHBbP7w4V/
         lsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068280; x=1776673080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKKtC3Qnmy/nhNGVLZ07dvj7VhPVzyQUkTlW6PGzNKw=;
        b=EdVkZ1B945O5zW+CT1ITBfk4MU448Ppx7xkHVUeIkowhv+eNbbrtLwOZNeeO+ALOXM
         43qj3YV2t2FQg67NG4EV/MUURde+ziGuN5w6L5moCUTJ1e7dmkx2pcGdIarXa5MdEyHo
         d/s60eE75WtBRFYT0PpM5SYm7VNYYTBpMieREYxJuWco3L7falCjDaRCQA3yaoIhJdVe
         g4x4QqiV+t3wzxrTs9MCKfBvc/SaG63OGFZa/H43iuelNkiAjH2y3opJ1BxsA70lenQw
         7clPA84Qbg3s3n0yui/BrmJgBELCbeu3gqLchQGmA2O7f59+nqq3xisbzrfjp6WzW5rC
         V9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjNM/ScgchXNWoxOeHEwGuowBerHSyJqpYxfMDxxVvhYV4jhIbzrSpvCeP/z/1HN9MxD1LCVxDMrk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdW7nI/eKVqMCgouJx3zGaTMgCdltaD8z3EPhXHFik3D3NItrA
	+78p5mmuNKkdjZP0E9GeXKekK3TRI2xM005i7o3YkcS8SQ3s4IP+ECE3Oiw0HRjydsCJAW4JJx1
	G/BuEH14GsgGjokdA+Dlf97qmDkHQ9cs=
X-Gm-Gg: AeBDiet3+I+nZSMyTrorIXqInd9V3p329QgqlWZmfzHZn5MOuCcbgbrDBv69E2RRHC9
	y0SU1oHUgzGFERBmDt1fRC816oukBF6N04AhVmUBu0haaiueT4RoFMTrZs9I3uRoGCv6sg7Vd2o
	9qur7hYLj+aIyTcfojsYrJk5Bx1uF8C4GlthfsYNb/nya2Fmd15Poqhj9imXZwVovYYj8AwN0Wb
	ortDitKJkbGvdyEGC7KMlh8hjDL6tKlfva9V3JBgEXHsBLI/R+8AJgqOVt75dVmqwncnDZ734P6
	gUJoiJ2GzJ7gZGlEtF5FH9bXbrI4T6Vnxf/BUUM/PjPGq+Ilb14gYHOI33OMDz8fQcSi8+f9LLZ
	FEpe6Mk0=
X-Received: by 2002:a17:906:ef0c:b0:b97:34e7:ea87 with SMTP id
 a640c23a62f3a-b9d7248ab15mr627211066b.19.1776068279504; Mon, 13 Apr 2026
 01:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn> <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
 <CAMpQs4+QmyAObvCcJOFnfTuufG8=M0q5m+XMkaP6-SOp-8wq9w@mail.gmail.com>
In-Reply-To: <CAMpQs4+QmyAObvCcJOFnfTuufG8=M0q5m+XMkaP6-SOp-8wq9w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 11:17:22 +0300
X-Gm-Features: AQROBzBJwSsZg2tUBgFtmmJxajkFQLHqP5eXC7UwkUnFX9NthWB1sHncPf4yD5E
Message-ID: <CAHp75Veymi3z2atMuSeDyrhyx-HLHgCMzJF5EgpJZzTGgpcD3Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 11:08=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.co=
m> wrote:
> On Mon, Apr 13, 2026 at 3:52=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loongs=
on.cn> wrote:

...

> > >  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.
> >
> > Was it a special requirement from maintainers?
>
> I=E2=80=99m actually a bit confused, because when I submitted the v6 patc=
hset,
> checkpatch didn=E2=80=99t issue this warning.
> But now, it produces the following output:
>
> scripts/checkpatch.pl --strict i2c-ls2k0300-v6/v6-0002*
> CHECK: Avoid CamelCase: <parent_rate_MHz>

It's a false positive of the checkpatch.

> #512: FILE: drivers/i2c/busses/i2c-ls2x-v2.c:437:
> +       priv->parent_rate_MHz =3D clk_get_rate(priv->clk);
>
> total: 0 errors, 0 warnings, 1 checks, 574 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inpl=
ace
>
> > Note, the physical units are special. The m and M have quite a
> > different multiplier value. So, even if asked by somebody I think it's
> > still arguably should be kept as MHz.

See above why.

--=20
With Best Regards,
Andy Shevchenko
