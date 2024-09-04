Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5D9DDCD
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725463470; cv=none; b=sz4KxpTDpMEfQusGGHIb2bG6LB2NB+BNAxXz6hnZGl+J9gaXKkAf/rfzPod+SqZYpzRR4y9XbzMCxIHJ0r7BS8YafuJziar+NIeh6z3oA/AoT81EtZvcwSAyhZStiilTIG3/BE4uwOQFK/Rp35z2aPVwSjVzXKzKOoqgvgWrLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725463470; c=relaxed/simple;
	bh=k4s71oW9moOCsdFZlopjnSjXbz5WCfMgT+KvfPUYXQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBtSuNqfhntyOEPa2OvdR1DPcZxmqzPPdlaSnX3TyZ3HJN0AdufRJoWbZxwaR4iY00o62qY6KDd80DTBNbF2EcOgtL9dwmQ15YmH1q98r0hH3vG8CLGqenFf9QLWKq2cgZYrdEEN++3ihTVD7yfb+ywgt5+/c29vXP8dxjULbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+xK7gA4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+xK7gA4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-535694d67eeso561223e87.0
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 08:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725463467; x=1726068267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4s71oW9moOCsdFZlopjnSjXbz5WCfMgT+KvfPUYXQw=;
        b=B+xK7gA4VKQ05Tb8/70cbmDpTVrekUcGaDPWG7X0FB2LG0rk3yFvxEpq36Ot2eBKwy
         mhlS5m3RY5pv7aFyT+g/NXgbpmsO0Tng3+ypSfzBT1z70TKWe4Z2KLNUd8OPgjuZtNsi
         lBmifb0M8jpH82MmgW2CYwJZw8LSE8p49JU2LLC4xpsERH7yhf9Fzny0GlfvaNFiGx9B
         jK8uaT9NmUzjDOp4CgK/sl98l4f1vnpBhhAZSSHrx1siHKpeERvIFHhjZ2EqhZ/i3Dh7
         K1QFoWAX4+mdYLKix0R85pQLsowVfmMEQ6HpWCMmMPVKahxEh7JIJ277PwWw6gCsn1sN
         tm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463467; x=1726068267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4s71oW9moOCsdFZlopjnSjXbz5WCfMgT+KvfPUYXQw=;
        b=uegOl0B8kQ9dMbLesiLHrMlfv8GD7gG46/K/f9q7Ry771Qs+NAcS8ooJzF/IZMJ3u1
         zaCJC/AiBPrEjhcqUKT+StBho+OBQa7zhUsBpslGxzUXEInrTmBhrDHDBftAn+/sLctA
         mqAKqjVynvSAXui8elHWEqH2vbrjLGaJVd+c4Bmpt720iKa84Cgplzlcrtm1beiKh+ek
         COK64mMPkfVPbgBuLMppY7uK3ZFDR6R/7KfCdjuAYtlFXojKSgkFrKD4xwvOXVsSX9jL
         X6wQmnFThFprB1/UzyqdQnpktyGwl9EE82d+4StCAiV8kDD21yI/inHO4vJsOoVOV0hP
         3L3g==
X-Gm-Message-State: AOJu0YwM2kl1gTVFSzhoUCazrHcx/hYqxWO1DMomw5rnP2BfCI7aWb3Q
	0WApajxZiks8vq4gcKHTOmkIymBv1Dj6367dyNNs8WzhQrRcGSwE+c1qz/Vn09OjIc9S2pcn01k
	UM6U+b7n7bnonAI3XJxu8c2GamW0=
X-Google-Smtp-Source: AGHT+IFZR3MLtznpkuUk2W+vfgapW1m/zYiHRXTV7QKkHUEzrgRx2bld4Et4sniTdM4ewEqOtObr9aJ8g993PFBLQNo=
X-Received: by 2002:a05:6512:b90:b0:533:4191:fa4a with SMTP id
 2adb3069b0e04-53567790bd5mr880356e87.15.1725463465795; Wed, 04 Sep 2024
 08:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904095205.739422-1-ubizjak@gmail.com> <CAAhV-H5WX7KXXpLkLm_4L-y5J-4fx-72uN+cvFGOZZh2NXUbHw@mail.gmail.com>
In-Reply-To: <CAAhV-H5WX7KXXpLkLm_4L-y5J-4fx-72uN+cvFGOZZh2NXUbHw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 4 Sep 2024 17:24:13 +0200
Message-ID: <CAFULd4abR8Upu5UecVes-sEc9his2yWL7pg8hwKSJ+ORSNL5Ag@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 5:02=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Uros,
>
> Thank you for your patch.
>
> On Wed, Sep 4, 2024 at 5:52=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
> >
> > _percpu_read() and _percpu_write() macros call __percpu_read()
> > and __percpu_write() static inline functions that result in a single
> > assembly instruction. Percpu infrastructure expects its leaf
> > definitions to encode the size of their percpu variable, so the patch
> > merges asm clauses from the static inline function into the
> > corresponding leaf macros.
> It seems in some other places we prefer inline functions rather than
> macros, but this patch is the opposite...

Please note that these are leaf macros (functions), always used
through the upper level macro (see e.g. the definition of
raw_cpu_read() and __pcpu_size_call_return() in
include/linux/percpu-defs.h). These upper level macros do type check
on the pointer, so there is no need to do it again in the leaf macro.
The percpu address space checks on x86 depend on the presence of these
checks.

> >
> > The secondary effect of this change is to avoid explicit __percpu
> > function arguments. Currently, __percpu macro is defined in
> > include/linux/compiler_types.h, but with proposed patch [1],
> > __percpu definition will need macros from include/asm-generic/percpu.h,
> > creating forward dependency loop.
> Macros don't check types, so use macros to drop "__percpu" checking?
> Seems a little strange.

As explained above, types are checked in the upper level macro (that
uses these leaf macros) through __verify_pcpu_ptr(). These checks
currently use sparse to check __percpu tag, but x86 will soon use the
compiler infrastructure with much more powerful checks in this place.

So, there is really no need to type check percpu pointer also in leaf funct=
ions.

Best regards,
Uros.
