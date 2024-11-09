Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAB2148FEB
	for <loongarch@lists.linux.dev>; Sat,  9 Nov 2024 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731150463; cv=none; b=uf05iSxY1eIk7WtQt9H8VbUJksVJO0yAFN4LiKNKc67UYEjYeqDkRNAYZhW2sKCVPT3DpehYv+oZ8wlAi8HkFIQXS4K/Spq21KnuMWXmds3MPhjDOoaqcEdZsEbcg4jozTg2WP915uN2s3BcTTimlM2ouzTMuxzcT5+tu24+29I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731150463; c=relaxed/simple;
	bh=QS9QXHA9aIA753MlX+rgP6S52wu6QOzrQQPQXLb4Oug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqpDCYcQ/KVvotVs/jwP8UqPRxH9c1VCAYRoy4iB9/71MnV/rEiqk3qgza/I1HM0HS9d3x+NjsXGZuTKTab/DiBtklGP1DPTT0nJss1TDVHMY1zsGJ3k8bRtP7YkkOOfx/Aaf14S7kk9UpMIytzeEwBJrGbjOJ47WQebcD8B65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKhA3kzt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKhA3kzt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cebcf96fabso3628212a12.3
        for <loongarch@lists.linux.dev>; Sat, 09 Nov 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731150460; x=1731755260; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awye95iv1yEMNkGuGKMnnPe3aEgESR2qeEte2B8YfLU=;
        b=nKhA3kztDeyJWefepZaD2dKXyWzZf3vfJo30T+8z210Qca8jjxvj8FCgW+0rM7Zlf3
         CoWWe4stnJDluShLO3WEWjrye/kozzvu3TbK1QP++2O8ibloJL6uZoHTdvPhwZ+jXLnM
         5gUD5mgpVEPimlfWBn6pCWchwjA5KoewqoHwXcAYXTVXYU4uqw5VBpLNBiz+Slo75/s/
         Gw2QJ1lr8LhC0x3qbQj1HgCoMUdsaA9VSJk7HoRyc2iGx9ibMNCcvPoddQ0acOdsKHGO
         SUvnYyvDJJ2rT/pB7XvCeahVbjAM9dvzuqzWHhXcD8ZHcOaApMu2Mg+9v2NcpZjcV9nU
         6zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731150460; x=1731755260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awye95iv1yEMNkGuGKMnnPe3aEgESR2qeEte2B8YfLU=;
        b=K0luLo0Jrx7KlrEAH1iutEwRJsE139/AkAwzWg6BYq2hzThixG+8x3JkYLjBbMn2uD
         qWMzT8PNLbp745c4lO9kz3QYxS5CZxBLMKMO7sizjHzmnYUhuiv4T5UmF+42yc6GVaxE
         23ONCkeAXlBLx778EmD9j7U0KgGOHQzCeIcxT+hfyQy6yL+Rg8kRwQb2Kfc2DKJGjg2q
         JhhX1oTFHTKT6oD3JeOfBnL87FV5TlWfAHQdzLx4Dgt+PkiVD2gj41l71UmRKhGxwTjN
         deh/tMYV/FEHDvnjPJ0RZf6zQxPuIE4Ws9Y+x8kZEE+DV5I7lwPWYb8rCUqq5jz3s7js
         B6mg==
X-Forwarded-Encrypted: i=1; AJvYcCWepoIx77XHC5eLzslPLJCeRqar47Hfjt8tN4O/ZigFLf1mDMYKn6M55oEcksBVa6SSqruKUu3PWzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz97zqBN8m97D1k3rH7/GiSI6OUdLY8v98jQiyFaTvUAw6IPT22
	R2cWt4EFyUpAhW+B5wz2Ptqilb9qhSk0UR9yjdtM3BaGfoT1phDYT0dI7isRGGXmAGjWDBs9IdU
	822RmTcIp+Lf7y3WcGUgXIb0LQlzTHoK4sySvGnwB
X-Google-Smtp-Source: AGHT+IE7QnnwmUPJHAhpYjQ53+P2XjG8mYIekPucikrnAm6nBdhxXkmutfFnCQ+ZZUdwIEe3sKpwxcnrh3kFtMAUPPU=
X-Received: by 2002:a05:6402:40d6:b0:5cf:1b53:1bf4 with SMTP id
 4fb4d7f45d1cf-5cf1b531cfemr1676430a12.17.1731150459603; Sat, 09 Nov 2024
 03:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1729583747.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1729583747.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 9 Nov 2024 17:07:24 +0600
Message-ID: <CAMpQs4Lv0_RjoyzJHtrekbHB+OiV5Si6yPEgp_u1ZZKkthGzhw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] pwm: Introduce pwm driver for the Loongson family chips
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Sean Young <sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 3:04=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patchset introduce a generic PWM framework driver for Loongson famil=
y.
> Each PWM has one pulse width output signal and one pulse input signal to =
be measured.
>
> It can be found on Loongson-2K series cpus and Loongson LS7A bridge chips=
.
>
> Thanks.
>
> -------
> V7:
> Thanks for Sean's advice.
> patch (2/2):
>  - Set chip->atomic to keep pwm_apply_atomic() can be used with the pwm.
>  - Test with CONFIG_PWM_DEBUG and CONFIG_DEBUG_ATOMIC_SLEEP enabled.
>
> Link to V6:
> https://lore.kernel.org/all/cover.1728463622.git.zhoubinbin@loongson.cn/

Hi Uwe:

Gentle ping.
Any comments about this patchset ?

>
> V6:
> patch (2/2):
>  - Rebase on pwm/for-next;
>  - Add Reference Manual;
>  - Shortcut if !pwm->state.enabled;
>  - When state->enabled is true, unconditionally execute
>    pwm_loongson_set_polarity() to avoid that the polarity register is
>    not set correctly.
>
> Link to V5:
> https://lore.kernel.org/all/cover.1720516327.git.zhoubinbin@loongson.cn/
>
> V5:
> patch (2/2):
>  - Rebase on pwm/for-next;
>  - Test with PWM_DEBUG enabled.
>  - In pwm_loongson_apply(), the pwm state is determined before the pwm
>    polarity, avoid test failures when PWM_DEBUG is enabled;
>  - Added DIV64_U64_ROUND_UP in pwm_loongson_get_state() to avoid
>    precision loss and to avoid test failures when PWM_DEBUG is enabled.
>
> Link to V4:
> https://lore.kernel.org/all/cover.1716795485.git.zhoubinbin@loongson.cn/
>
> V4:
> patch (2/2):
>  - Rebase on pwm/for-next;
>  - Addressed Uwe's review comments:
>    - Make use of devm_pwmchip_alloc() function;
>    - Add Limitations description;
>    - Add LOONGSON_ prefix for Loongson pwm register defines;
>    - Keep regs written only once;
>    - Rewrite duty/period calculation;
>    - Add dev_err_probe() in .probe();
>    - Fix some code style.
>
> Link to V3:
> https://lore.kernel.org/linux-pwm/cover.1713164810.git.zhoubinbin@loongso=
n.cn/
>
> V3:
> patch (1/2):
>  - Add Reviewed-by tag from Krzysztof, thanks.
> patch (2/2):
>  - Several code stlye adjustments, such as line breaks.
>
> Link to V2:
> https://lore.kernel.org/all/cover.1712732719.git.zhoubinbin@loongson.cn/
>
> v2:
> - Remove the dts-related patches and update dts at once after all
> relevant drivers are complete.
> patch (1/2):
>  - The dt-binding filename should match compatible, rename it as
>    loongson,ls7a-pwm.yaml;
>  - Update binding description;
>  - Add description for each pwm cell;
>  - Drop '#pwm-cells' from required, for pwm.yaml makes it required alread=
y.
>
> Link to v1:
> https://lore.kernel.org/linux-pwm/cover.1711953223.git.zhoubinbin@loongso=
n.cn/
>
> Binbin Zhou (2):
>   dt-bindings: pwm: Add Loongson PWM controller
>   pwm: Add Loongson PWM controller support
>
>  .../bindings/pwm/loongson,ls7a-pwm.yaml       |  66 ++++
>  MAINTAINERS                                   |   7 +
>  drivers/pwm/Kconfig                           |  12 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-loongson.c                    | 288 ++++++++++++++++++
>  5 files changed, 374 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/loongson,ls7a-p=
wm.yaml
>  create mode 100644 drivers/pwm/pwm-loongson.c
>
>
> base-commit: c13bce43b32b06f2273c7961940c391cdaf13d1e
> --
> 2.43.5
>


--
Thanks.
Binbin
