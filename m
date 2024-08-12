Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731911CAAF
	for <loongarch@lists.linux.dev>; Mon, 12 Aug 2024 04:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723435800; cv=none; b=grZreLCs2nr1eF11gCLicWD6t4FUsVB9AD+qGuV6CwpFvNCGU+O/spRB6PD/ulQhSu0yg7GVm8O0mdSQJWsQ3gB623URTj7+sNZT0kDAIz727T6p7o/QpGtFQM8QUQfcnJWKcgWpOWZwgoFNEBRkMBx7/DYokDJ+XzaNGtZVOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723435800; c=relaxed/simple;
	bh=Nz13qZRMO+8sM//2Uq5O3FWReYdpqXz/N7MyKZsuhh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mi2ttIJgjCyscSRkJjTtw5h1PZooEkHTa2225Zk1mzqlwDiLrArcnglQ02SstWfdozCmdLobtD27KipQho9nTbS288NCzSPMrVwi7/Ph5ms5R1RnrQYPzGBzmAlXgRiBuKI6HWqe0l7BCafdhXmnRJyBI5HlLy/PAbSpKO7Qp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUMCEGEx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUMCEGEx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a309d1a788so4113409a12.3
        for <loongarch@lists.linux.dev>; Sun, 11 Aug 2024 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723435797; x=1724040597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgwBBHDKF3XyqcweRsbgYDEM8KpDwqpwsQt06/SzYk4=;
        b=ZUMCEGExD4BAfz4HoOLybgyTYo+ifUcf1hbsT/nMgg3rhK1/0w8g/r85TyBAYAiy3C
         NWO98f7LQXxB/+E+qxuzdJWXbXsTpRFZPpH143E7jPsW3yp1umN6Tg2an/VlN05CQqbi
         Zx6jLhRXZtD9ge923DqJ0OTqMrXGNozwK2KITq6mxxdIS3nIM8ybMiGgP8l9P4EUTh1T
         uHsfyax4TJdHGyuCrR8y0Lu+K5w8JYxIbOPKrxkA2Wa4yJjgdlEoEZ5JOh6KabhTNmEJ
         moegsWCHa0XK5jNehOPHQ+k73ICST3Yq40FVBt+BqrX2Cw1oKzmuMQGT87IW2VJ4SZTA
         0Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723435797; x=1724040597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgwBBHDKF3XyqcweRsbgYDEM8KpDwqpwsQt06/SzYk4=;
        b=W4ABo81AaMTu8d3pKQ0ZF9dmS0Fn+ALJwdAXZkYH94Wj9wX9hr6unOXMOWGqqsVvz9
         5fAJUPHnVIoycycx4tMnkFa5sUmK9DeuFUwZ+9Jvb47AFybr70jj5dQmu0rx0aXndGTM
         wGHRwIzpes+2LQIrhehwbjkeY4h/lfRyl3LAD1VLEIMNT+SJUeZBFoEgeikoGOwHvaSL
         IM8Sg/Rucrof/vNnZrkJa1sao+nho5eCFwRSAEmzsH+znb7Iuq0Kfbi0+E64U3isUUXM
         Si9FmJ3LAbKu2UUPEwZbp/tGoSinu6tGFjdMSVH5b3hIxnj3QMDjJ/TnHav1N8Lg/o+P
         lHAA==
X-Forwarded-Encrypted: i=1; AJvYcCVrHWRG9VpiMduFS2VlNkJJd6GykdbbvzGISXnPYuKv75aydwi5Z0nymeTtvX9+JPpnartjH54NfVIFAvgdvlUpWF7wG69t9wxB
X-Gm-Message-State: AOJu0YyaWGQqFQHsaXf27nH+Um1KaeqXRuYE8dQZKNstRv6qszfkZxwy
	2wE1M+AwpfEyivqLxhxdnqsvfXVh0gzpTziJM0ij5zkULjn+pulDkEpsdvIH8x8/RuXs7Vi89Of
	fM7pjKnJaTwYsHZYLUPCl2Bqr87qG95iL3SWnqg==
X-Google-Smtp-Source: AGHT+IGlOC34jE6ub2+SaPQP8dRnvG7v/0QziQXHtGbrcOv3t3sWovaoNXJZIcTOySlnoSpUPZBWkSa+HbIpe475f+k=
X-Received: by 2002:a17:907:e6de:b0:a7a:8e98:890d with SMTP id
 a640c23a62f3a-a80aa594fa0mr646057466b.16.1723435796323; Sun, 11 Aug 2024
 21:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1720516327.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1720516327.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 12 Aug 2024 10:09:43 +0600
Message-ID: <CAMpQs4LntAd4358QBSSC-xHOOyhVa_jLrTGk0-ppa9oyPgdWSg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] pwm: Introduce pwm driver for the Loongson family chips
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 10:04=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
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
> V5:
> patch (2/2):
>  - Rebase on pwm/for-next;
>  - Test with PWM_DEBUG enabled;
>  - Rewrote pwm_loongson_apply() and adjusted the order of pwm status and
>    polarity to avoid test failure;
>  - Added DIV64_U64_ROUND_UP in pwm_loongson_get_state() to avoid
>    precision loss and to avoid test failures.
>
> Link to V4:
> https://lore.kernel.org/all/cover.1716795485.git.zhoubinbin@loongson.cn/

Hi Uwe:

Sorry to interrupt.
I have tested the patchset on the pwm-next
branch(861a4272660ac0ff51aa4e2dbfbc3276c06b35eb) with PWM_DEBUG
enabled.
Please review it for me at your leisure.

Thanks.
Binbin
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
>  drivers/pwm/pwm-loongson.c                    | 285 ++++++++++++++++++
>  5 files changed, 371 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/loongson,ls7a-p=
wm.yaml
>  create mode 100644 drivers/pwm/pwm-loongson.c
>
> --
> 2.43.5
>
