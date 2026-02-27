Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146B5376BCE
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186139; cv=pass; b=W2h5ApVlN4AE0VSWSlPCAMwTVlSTK4LgAc95XfYlIkuVL7pvGwET/HF0+kfErJssuVyo8k30byMrPRaM5M9CsdlEavPxsjinHBd62A4PlDkpRf7tttKkODu2/Cz2YBi8oGY5uIQJ2SKB3XuR1As+6+e9yNxiHvzdeq/cmNnwIo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186139; c=relaxed/simple;
	bh=HiSI0lU9AAW8Bi7i/XZVtO7ZCqEmkeDjYdIHFxH1EcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKIFIg2BpqBnCYYL1R2J7q88e5qPGIIhppmJ6VygOZMe638z00SHRfCMWH8gaJoyBX2GRMcLXCIx4ZB8+hqVtZUY9X5gZ3kTXSUKsVAFIhd5xqv/P1ZuirNjje26xJ/MfZKKtYPYYPcgjTVXbMlZQoxZIQlM2Ew/zFJp082HvpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeR1PcPC; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeR1PcPC"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-679aebf4e56so1327485eaf.3
        for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 01:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772186137; cv=none;
        d=google.com; s=arc-20240605;
        b=N2zucbZ68WtyXlCU/E/BLa8AhkyZu5dz62mTtihLZYVJpn2536Da/dmPbphzvgjdd6
         vH7N5XxpD8Yvj1LooL+JeIxN+0AGXyCBGURUMabI7bg8G83jenvDaNa9nSve9e8vyoGg
         eHHW4PZbrGZqL+zZhuOatfO4ysLHOPPaNGl7LX4NhtXn88QmbAysLnFvcWzhIm2rGTe3
         NigIW3sGjZpDdYPmmOSXT0xyXB3pALUP5k8dLlPSvJxtjzDTxVGOWvT0O5e58HrDH+8V
         sqz38VBfARsH0rGSKhkpTLjln+XyDVfI7u55+cFbn1HegoqVW3qvkeV/AeUKyFY5YdS/
         Epvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/KJb9IiHquzk7HYxCf6i4TfDA+7vLU5j0god34XCBM=;
        fh=5uUrYSlznIUdeLxCG//6N5siR8zTB3L7MnxTsxCm5Oo=;
        b=cxQBd7T0NNd15ozqFXMcX41GyN7bMZgLTWHWgawlfM0hezinfxIWFrh9ZrYbP15pqP
         vJegycNYZgxjucxZF8Isjaeb41tinZ5xPEVvKT5PP/Nw4R5yCWGLaS8DOhQp5x0Oo71W
         d/1CPDABBDjRzFm1qDdMRSw07F95RergBkStw1QGa7v8t1anhJt9EuMhrpYjk6DBT+QB
         6kCH4Gx62fV8Waz1rk7LJauB+mk0FaVqZVE+2Jf7tqBFimb7wPsWkVKCDpFW/g/t1GVI
         254l5SRZc0Df4dZhmBhhy5BVC4h4m+mUX7QJVubvf6loixm9TWYFqXiOFDkViaY2M8TY
         iYPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772186137; x=1772790937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/KJb9IiHquzk7HYxCf6i4TfDA+7vLU5j0god34XCBM=;
        b=TeR1PcPCnTn7p1BLgqh9PaSUNCiBwZOB8AA2QAsGys5DN1qCrf7h8GvjvcWpzthP+k
         osEGXJS0AFKi9IQGeA7NLKxQOqirFAmQkvyRRj6Fs9H2P6aZ4Nzhg11teevsmLR4G1G7
         ljmXdDGogSwv5MqZJanuKjhJAp/LHKiKxUUh0fj64Ry5vDDog2kV9157VUI8xqVBWTph
         T9mre2Ztzju1uA/cgbiIliOhlVuYJiBm5w03TO3LGYbW+GG9vJdIaDgzRc3RwL3QQ9rS
         v2QS2JaJIzURhQS6/OkGtPoGSKpV34leBlzLxlowWI3PMHGCJbnZTJYFikqdrkJXTKCY
         m6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772186137; x=1772790937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/KJb9IiHquzk7HYxCf6i4TfDA+7vLU5j0god34XCBM=;
        b=aO8I2YeGBYGP7/e5rUMCR0qNXEBbuwo4Q5BxzftYmsTMulyMuSbLIsRcEAET29Lb+x
         Lslh7O+XhS5x5xjFk7whghWEWm6YPdw2aR4gCi1OgCHfODwOr/+kc05Y4Lve0UL+1eB/
         n6BfuMqpFsL58qELha3BIkEOQDvahd8tWOpNCRO37wCxCGlkqpLBEkjSHC847E9NRWok
         PgWo3DQNkn+A1wFgolnE4jd063wbPBYz6sih8+qv6gZ4TIXxQO8oOAcPkMtrli8btEZW
         zjk2T1v+JZqPurT5Wc+rCLG0xY/Fu9pgzoM4N1Go82L5XgMLj8RfEQFZIdgoeki8Qp6P
         qybg==
X-Forwarded-Encrypted: i=1; AJvYcCXLOUK+GA/NRpvYWnUKi1dSfKH750QPwO/XPZUFTm3ls/KzI4a9Uq+PuPzeftWzn31K0iwG87jjpY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Ed2QwOmh/WXBmB1SI3EoWQeOlf6mR4txodO94qjesQ8MlzxD
	KuDcov7O9FVSd5Nhk7QfVmYoO2RL5bES21xBLv/mPS7wSCMPkEyrSqoj4M7o1aJMcdwCJjGJHlt
	K2SOgZxJHwnSSuGNv5tuKPsF01m0z188=
X-Gm-Gg: ATEYQzzG8S8k0WYoxZb7F1kKYLMcAXzko5ytYOyfZG8ygWddfK5v4Xqr5E82nm0i+JT
	uO9d4zRTy+uwVPbFqy5NjcEvd1bEl/OHQd3z03PJJHfHJfRfulTNmFDB1+FvZMpwai0qoAmuI6o
	vEIrHgTHaHmFw4CFQlO4veTUFeJe8DOGxR6Eq18dke+Yt6oOLKIBPwNaZsRqYSMGvh0NmM5a91/
	czBVCa3HcQC1baHigA/wWKjnkxJPmOJg3CATn+kxerwZjXNd9fwcLtIcix0wpcKsS6YY2yFoeIG
	ArXy+o9AMwHhjacLn/s=
X-Received: by 2002:a05:6820:488a:b0:673:ebaf:ce52 with SMTP id
 006d021491bc7-679faf84b68mr1104232eaf.57.1772186137013; Fri, 27 Feb 2026
 01:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224073515.1273-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260224073515.1273-1-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 27 Feb 2026 17:55:25 +0800
X-Gm-Features: AaiRm52XVBiKUry11FjHKqNVfETs7nGqLIo9iJjKEFSTMsaM-HMLMgEvnGKb08o
Message-ID: <CAEyhmHQVTzOohJUAL5FfP39pY=8q=ui7LYE3Z4+n1s71GK3Shw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] LoongArch: BPF: Support more features for trampoline
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 3:35=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> This series is based on Linux 7.0-rc1, tested on Loongson-3A6000,
> the main aim is to support small struct arguments and 12 function
> arguments for LoongArch BPF trampoline.
>
> Tiezhu Yang (3):
>   LoongArch: BPF: Open code and remove invoke_bpf_mod_ret()
>   LoongArch: BPF: Support small struct arguments for trampoline
>   LoongArch: BPF: support 12 function arguments for trampoline
>

For the series:
Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/net/bpf_jit.c | 109 +++++++++++++++++++++++------------
>  1 file changed, 71 insertions(+), 38 deletions(-)
>
> --
> 2.42.0
>
