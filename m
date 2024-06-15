Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D371E487
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718454714; cv=none; b=ufNz81Bbm/XRZ9JiCuthcG31dnL5BQf10Hn9EvSbEgp4bpFnUCgyI4Pie1gIzdyvO6rEcHFwKHeX8fuBeU62AJH7pQH6c4Uh7/r5734TCFVjy3nrJlfE5BL3sbGPtSF2DyoNIVy/nilkgrIS2A31osuRgCUgQD5svg9Em1RoO5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718454714; c=relaxed/simple;
	bh=ChOsz5Prpt2kmPetgz63MyP/4cgSlQ4sFxq+D3hI9O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uw9H9Ez7djPOjZKx3rlRSCw7cpN/I0sN3qVSuIN4K43e0FBCm7gJ9Kq9X6EGCfSlej3khTF6DB8rA1Rjqg1F5nuUemA+Ch7K09B3jJs2gZAnshxln50MsnfWKi3njdalVYCCMe+S81p4VUISX3UONxxtUbVXp8TDHnI2qgyJGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGUhz50p; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGUhz50p"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6333082fb8fso10227937b3.2
        for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718454712; x=1719059512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J36wE6b4n7qYMEp0NDKveqjJUdZ2UEb0nYa/HH/nTM=;
        b=jGUhz50pmGIIP/n4Bc+dcRKdTHqRKry5zfmowDo6XxzNNnRIpbhrEmGPYo/IluZN+z
         7P9ssKhc7Uw5M68vxvPaYIhIDo2Nxa1d6JN4ya671M7pHTaQerIFNzIMdpJLGnzXC/2s
         wLSywZwD6Uqy3HEBuLfp5bOrdyoHFCom9OcK8a6tYCbYoJVi+9eBzrk4Uz2mWhJ93SRz
         dekbyjZUVe3ERLKiDaClAlP/SO7vifooXdZIkb+ULn8XErgeKiZ8tg8gqCXcQPws8tpz
         uHTep4YxVm8SYTGX5zA61tIwzMSE/ChuieZaNgihrnKaKSsb8aEdSRNwi72ytXzj19kg
         2UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718454712; x=1719059512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0J36wE6b4n7qYMEp0NDKveqjJUdZ2UEb0nYa/HH/nTM=;
        b=HM2imdqQC34NGFtZPK6sXuoRptwsNIyilc7tOUnO1B0JoPN+bQ4VttCQvRB0XmOOev
         Bf37k3WAbK5hvc1bfbI/HfOgLO7cZFhrnx15HD5Hxxi0oo96cpBf3EsfVa0TXlgn4IvJ
         x1q+MNM9W69o4UIDJzPWksr+7cuUqg+BTzHu9JqwJEysPFNrew2m9OFQC1gb2IymS3OK
         xu7RqrWVxVfqLOnCskkaHzhIUTtiYstMnqZWyRORMmSXN4AHVk1go861ZOaqgyGOKrAP
         UgD1ta5K9wq5vIBI0HhAdHosMojkIj+IfGEpmmy6kVJLqXO1i30S1PZcsCZTjEuk1s+w
         lgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU8upedq6AGXUMPRA23nU2WT1tyh9fXeIp4hfiObjjU7uLBVctri/8HtbFC3q5OFlrj3xhnA6z9egDWmDsNqowa32K/K4iGBwr
X-Gm-Message-State: AOJu0Yx6atvY2x9lK4cYDt9iSCTqhwp4t4/K5rKGARY9ZrH2FWgEkj5N
	mq1LwIVtKmF7V2G9b5+fyXPgx+2UtIuWnwk/81mmZ+NDxxJPVpr4cY296AhIc1n1BkUJyqVtY32
	T8LJ6ivRLaljvfnAjw7q8DOf6NI4=
X-Google-Smtp-Source: AGHT+IEc9Vgb7cAlh15eM+4S5w50+0KC+qZwBciCyJ4XzMPGsUAxR/DiAHijKkveG5RTC5/yj3a28JH1VolMn34rsrY=
X-Received: by 2002:a0d:f703:0:b0:61b:9369:ef37 with SMTP id
 00721157ae682-6322441a7b7mr46690077b3.46.1718454712215; Sat, 15 Jun 2024
 05:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1716795485.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1716795485.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 15 Jun 2024 20:31:41 +0800
Message-ID: <CAMpQs4L=JV_tSQN_LgcwzAUjKvQ-vt8zcJO9OaKQha6zCztw6w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pwm: Introduce pwm driver for the Loongson family chips
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:51=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
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
> V4:
> patch (2/2):
>  - Rebase on pwm/for-next;
>  - Addressed Uwe's review comments, thanks.
>    - Make use of devm_pwmchip_alloc() function;
>    - Add Limitations description;
>    - Add LOONGSON_ prefix for Loongson pwm register defines;
>    - Keep regs written only once;
>    - Rewrite duty/period calculation;
>    - Add dev_err_probe() in .probe();
>    - Put the parameters used by PM into a separate
>      structure(pwm_loongson_suspend_store);
>    - Fix some code style.
>
> Link to V3:
> https://lore.kernel.org/linux-pwm/cover.1713164810.git.zhoubinbin@loongso=
n.cn/

Hi Uwe:

Gentle ping.
I seem to have addressed your review comments for the v3 patchset,
please review it when you have time.

Thanks.
Binbin
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
>  drivers/pwm/pwm-loongson.c                    | 295 ++++++++++++++++++
>  5 files changed, 381 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/loongson,ls7a-p=
wm.yaml
>  create mode 100644 drivers/pwm/pwm-loongson.c
>
> --
> 2.43.0
>
