Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011613AB26B
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072386; cv=pass; b=B7FvUfdeUW2Zae+J6Hf9kV1KnrI5u4lxfMRapDTI1iPf46Stfa49hkF7Ygl0HJhekLKBJmpQbbW3p/fsRU9p5dmwSwKQWyAAgV1+V2dCxuMIvjXjMVJ1ZElrsDCWieHiOfkJKNOMkIdwj0Njhed1Tqzgj4TQ5p74ykkrME60lSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072386; c=relaxed/simple;
	bh=AIj8v0Hi8sQvxNr/C2OEW3Yh01lDZBaIZhuDD3/FUIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+SE/czMh8FgjbYhl7CyVMXMffpDCECXL897UPyrMiWY2pNSOrpXQzrZ2m3AA/FiCpPXKWS9UDdQLlXhtJKqXQPBJuxELtTD0jqDpuYnnSNPX/SIwx2iwlEYqjJzoCfpfd9siMjjkR+3SSAAFI+KCk22RfC5kyBz4intZE/leBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9Xmhx8G; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9Xmhx8G"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-670c6c6e64dso4181021a12.2
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 02:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776072383; cv=none;
        d=google.com; s=arc-20240605;
        b=a0PGIqoi2Eu7gZINa9JN5yL3cOaFebsvC/9K42tVtnml887+Gt0CXMfEnPRjRXrmSr
         zpaS2+QtMZGxNLlvJ5oM5XBj1gi3sgOPyglCCdJZNqgIaYfLrfUcc6vEi7HipmLrQBX5
         1T+q2z4tL8GFI4BKQ+dE/9uz4OoDCl282ds/WIrEdz+VmAenE2/06yI+FNDN7fxH0rpH
         /WdLBQBd7wS2OE0/oZBV1CFPy43HtnA0eCxxC9ERG5IapzEm8Y50zy+G2cCelnOE44zl
         6UQS1gbC7babUkzXKNiu4VAuJxYTAXRg3pD3NkFJjhcHmDwxNZd2v4dkQitj71MLEf4S
         Oi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3iu2/uJJ+f3nvEEkeX9hHnOtEpFD7REsnR2pQwo48Y=;
        fh=PJ1/S8UL09GzT/74hK4Tb7/NnDtHmkB3m9LBNS/7apo=;
        b=ls6PY5KivUXqKQXVsLvQmvTwJTwCfAshA1XCl+cHJa1CKeBXlTnJHNeEf2f1bkAeLq
         1Ftp62w+pXloVAemrbxL0eCB3/grDKQ+YfkdAbV64p4XJxqQnM8GorshmPygAaa3Tbrw
         kbB07zNLO6RAALTlF6elweeAdSRhwqCh+uF5Ork4oKMoqYofWP0+fMoqprCC1HGvS995
         kmMnQ83LvYRToQ3DT9zKbSIQAQyBl8P+A19ppPSB79nJVANZTsWDaQDuSZF95lCb2jkr
         m6R7T6R2G9NOO/nlsO1At6rWJWqEQBB5oP81o5SaVQzEpnzgHr6SkFLdcm6Ps8beUN7p
         HelA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776072383; x=1776677183; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3iu2/uJJ+f3nvEEkeX9hHnOtEpFD7REsnR2pQwo48Y=;
        b=k9Xmhx8GC4RiF/RyGQGD89RLSxzefMRboCkZupYmXYEcKi8ybWZHvfFpCC/oywdOcz
         XWaTCDf4EVfJ57Ebw95je5DvcFrZJwV/nIfXidkp84RKzmJD8uXw1NfuawvUgdIZwbgf
         WrC2JBb4fu/eT25cA1zgUsgyg326EEAn3ocBfepeZmxwu1npE0AEG3IMZhNPl/jW27Ip
         qNuDMIrcHzIJu1t4vpFt/jfwk12HlZp6r9OfeYDQpmRscvEEB3h/igWGMtrQ+ko0m4Wp
         SWZtUMryTjJPs7juDDh/xvcnjS1Hpt09D1OLGESh6028otG98+iMA8u0z4AfpysUsFD+
         nPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072383; x=1776677183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3iu2/uJJ+f3nvEEkeX9hHnOtEpFD7REsnR2pQwo48Y=;
        b=ZMyI6ByiP1fqPune+FST3qktvAz8ZQyrcHFW1cD4+aJbyKUFk+ym1LmFSfE5/J/olf
         yLPoQjVL8Jt89mzSm+DzceHLbj2nAtD3xGQTyat4RNspy2vehB42vgoeiaRGnx0sM+S5
         HxeS+tpBwntmM+pbpAnE/u7Xvhj0CkIqVSrvfEjedNnFsstc+9HdYWm1mNu8z6uKBG/2
         Vfzh3rBPuIgazhpf292iwOgztqBzj8idf0TCQCFKeYy8UnrrkrLyKwwSgUFuzES8f7na
         iG6BPTDE87ZWB64w+j98ab+x1BozDkLFzHABvhjnN7ue0Okre0Xqj7iKCGqKFUI6Yd3H
         t04A==
X-Forwarded-Encrypted: i=1; AFNElJ+EcTBcbzNj7cz4+7IX+09kKVjdraGIAG8neqfku/wR8yTD6yvbOdmPU5miMD/jZf4LWtarNWPxCyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYrOIkyp58kI0hGcoBdeYjVzLqgdY4f4lbS7qjO0MrCPrzN/HC
	E/vnqo2O+Qn0w6/ImlJAz+yH2hVoGVrwYBY+xP8VZ3Uoga8VG66i3Gip8koMoHge11itfUav5NM
	cNtQubqt3Cs0pejo3PFT/YeMvxUuuU4Y=
X-Gm-Gg: AeBDietZzCk9qUWh/pPvo6t4/qI9K6jIFT/GWwwAYHPdq6kC7+XrzDgFPegqu/1dT9Q
	aTGEZXfGqLBlWu+X9nbLHfgVB/0PF1Ppa6OXEeogk15ZL8KusbC2n1x+taeUm/5C4jAvGC7wSCC
	GoG6/65zm37QHQFVsBYtOvzCAbVYs9y5nztLuUTyNmUA9E0hzdhjDFq7m/c62COKLI1gTqw9LtD
	L84fKKzoa+YIIA/EK1ZE7M6Qqlzmug6EmAaMHcBaPab00unPvAJv51b0XupZ4gvpsck6fUUe1rj
	tu5m/exMw65mSnm8tmw=
X-Received: by 2002:a05:6402:34cc:b0:670:8d21:dcb with SMTP id
 4fb4d7f45d1cf-6708d2110cbmr6408870a12.19.1776072382964; Mon, 13 Apr 2026
 02:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn> <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
 <CAMpQs4+QmyAObvCcJOFnfTuufG8=M0q5m+XMkaP6-SOp-8wq9w@mail.gmail.com> <CAHp75Veymi3z2atMuSeDyrhyx-HLHgCMzJF5EgpJZzTGgpcD3Q@mail.gmail.com>
In-Reply-To: <CAHp75Veymi3z2atMuSeDyrhyx-HLHgCMzJF5EgpJZzTGgpcD3Q@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 13 Apr 2026 17:26:09 +0800
X-Gm-Features: AQROBzBh6eBs7REn1Qv9IV594bWuIgt_mTQzWy_FshpZ6l48Ew5CqcVKTNMWbYw
Message-ID: <CAMpQs4LaQ27ZQhyv-s1OVcBF=4DR=_SiDTrpoB7F4qPRHEWB1w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 4:18=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 13, 2026 at 11:08=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.=
com> wrote:
> > On Mon, Apr 13, 2026 at 3:52=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loon=
gson.cn> wrote:
>
> ...
>
> > > >  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.
> > >
> > > Was it a special requirement from maintainers?
> >
> > I=E2=80=99m actually a bit confused, because when I submitted the v6 pa=
tchset,
> > checkpatch didn=E2=80=99t issue this warning.
> > But now, it produces the following output:
> >
> > scripts/checkpatch.pl --strict i2c-ls2k0300-v6/v6-0002*
> > CHECK: Avoid CamelCase: <parent_rate_MHz>
>
> It's a false positive of the checkpatch.

OK, I will revert this change.
>
> > #512: FILE: drivers/i2c/busses/i2c-ls2x-v2.c:437:
> > +       priv->parent_rate_MHz =3D clk_get_rate(priv->clk);
> >
> > total: 0 errors, 0 warnings, 1 checks, 574 lines checked
> >
> > NOTE: For some of the reported defects, checkpatch may be able to
> >       mechanically convert to the typical style using --fix or --fix-in=
place
> >
> > > Note, the physical units are special. The m and M have quite a
> > > different multiplier value. So, even if asked by somebody I think it'=
s
> > > still arguably should be kept as MHz.
>
> See above why.

I see, thanks.
>
> --
> With Best Regards,
> Andy Shevchenko

--=20
Thanks.
Binbin
