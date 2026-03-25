Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F42066DE
	for <loongarch@lists.linux.dev>; Wed, 25 Mar 2026 01:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774402575; cv=pass; b=Ek0XhEgtHKTielFykFqi1v2zx48JHX2EnNXjt+BCWQRXIL8FftcCVvUEW0fJXc1nq+BwOnvagw31az7bB/BHZO3w8KVkNes/jb5Lm6qsN6aTeR9ZQZSD2tx0ZKc2XHQA2DxLXnTj0M5WWSNjkdVM6Um+18ekyF1q7CICBqrPvgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774402575; c=relaxed/simple;
	bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7Y9+wjO1ZxysrK49hZeMz5UaOoYg78Q4IGhlMv8lO/2y6GxjSdIz7Ses84boUaDv0ROopTfheI4Yvtal4fxxZ8lFlNOBJriKrYq7lqRas4dC4pr4gYcXYwFJsr+yFA5wNM3T3h7siswDcjYzMOlS9awPp95f/rd3XoS3271GVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkGnuwyd; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkGnuwyd"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12a6b260693so399044c88.2
        for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 18:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774402574; cv=none;
        d=google.com; s=arc-20240605;
        b=cuY0VMyWAMvyBFc676fZKLqMK3oEbWfr9ZbwhF2gaBKBcxQ+G7yolUA91x6HI/ZCg3
         biSUFGGuDo7h3EB5LxL+AgKANDDLCcqNdFQd03FzOLmYpQFGxU6TbRlZmY74zrukedDf
         P1I0a7WZ9jiLPzza/MGrAAUpBMqbMr/lwZtYmq3Rg2sxx/DeKYUD6uVWPUCebXUnO3nw
         qrmIG982KAF3Uso1wsDTdDWv0ydqLqdKax8XLqna5RvvnuJ6ypZNmQowkIWFoDgH7W3Z
         rAn0UgJPadmPrLW2Pm8yslTfAu1T9msoFmCSUqcI1ET2ULeGJnyYvEJSqp5MliDlSRlD
         FDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
        fh=yddvZlbS308ei06GnmPJHe2beQl2Ej5U9YQ0l8/fK0g=;
        b=WSUWXOrmmvPEley7g4Z4A0IugKBTPlyIZayKs+UOkDIQe2L9KI957B0qpa95pVqiVd
         1mKqltT1CB9jdPhZcDIT503Wfy9IgAhicKgZEzJD5kaO3Jv4gzcr4V4KmQxgKmhpspx8
         XKaXaZ5uFaCDfoiMlLoSy3C5ptABjlB7xSMxHpueW18vwD4fEQ2HJtdVUvNNgLo/jyJn
         3GZQTPGVh1M6HDnJxEUwjNu6WHvApcC/8q434XQNJ1SyaifuGHp2HsII1LYXPvHIs5Hs
         eHJW6qN4WhmQkI465XFL381YlZExbTu17tDFsOPbb4txY6l6kxBsdN9MPGvRziIJVMfh
         f4cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774402574; x=1775007374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
        b=DkGnuwydHRirAXlYu5thvI7984Srsf7ZQgX5MTFzc3f7EUYNz+nzP2FJgTnr9DSEQh
         YXwJu3b7MKfJNU+OHqIzKF/AQLfXCYQViu+MiZWYQEMH1H6U1gz6m87MEurZpwfP+DEf
         36IVTh4CQ0Rs4zUvbuhu9Jl2WCoT4lZ/c/vbOorYzbCb3FxPrBMuKKd2igOgsz7wwGFK
         u8WU30IUrtTPfVXQY5we10RmZojP4ppqUGeT4gXi8X6IgZKhV6pVm0fvcvjH+0Djm25y
         Ln3e1Rq4NumVY42SshDlqx/PkYxgwawntPTi69ld2F5ErbPd+J5R0jHiKgoA9PGtT8vC
         sp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774402574; x=1775007374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
        b=HOOWDU8tE6UEtx+pEPn1nvoXCVczGzodJzpk72I4s+IOG36UqGxbbuslA6Q3DmS90w
         4+rYYS81JlyYxVWBAo//WKqIriPsh56wis7w1AbsoMWKqP2V8CRNyOYLCnUeILKv+E3Y
         TfcCEzU3NbPj7uIOPmGz1msTB9/8y0c7Bm9Ttl7Z1IQYt8dUtFwwpbS0FK+DXSy5S7Ha
         0XT/TtYr99oIU0kauz3mMzguCR6bYpzH5vxCfDqaYzSbRvUuiGvF8USwjEmeeBjNOxSv
         fj4WeOI/0+s9PFHkzyTHFC48NRV8ufRaU3zpv0FhAkqFNj37L46Msq7QqfZUrcPKfo2R
         OJtg==
X-Forwarded-Encrypted: i=1; AJvYcCW1MUb3bnw7RDqioeOkIuSm83ifTsivQVS7G/s8u1z6MGaP3dn5YzDXUpm4OxN7zlQ/n9zSMYBn+cI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhaJIh3eGMpTGPBJsDNvjhCwEkkQxZsEdAXA5+eIy8eTproBaR
	tnLP7o1bXBu17iSDBqFN32AYvr2wmMH0scSz6YZe2E2KW22mnty2MJKMDfM+1GUSoap6DFc6Hh4
	Lnk0VXqiBrAJ1jfO0D5hTtTBG1F0j6wk=
X-Gm-Gg: ATEYQzwfwoAPC2fyKyGUXzNEyT4LOzKiaNdu5/l2lXhXBATw0v8R582x2PHfSQeRYbm
	NnycA4D9HpzjO+B8d6fr3lyblxTg7z8IWCaDdqH2zmfF5W7K0ONc8WmodXB0pokRbUcaE1uDziR
	uwAJ8s+YZyEgogjcKWM2gFKLWiDJJyBivM/f5YH8BwS3rCj+RrvGn7Brx9t7+N0M4P5QMVTijux
	MY69RIisNdAwN1U4Gq0mtfrxwEhtc9y8/2eDfkx/a16E2vTe3kTJUbDMfBCiVX6ZX+F3NSPDRt2
	kp/EgVZVm42zw2YfQNn7w1VjVkZKESID4z86tM+xMge86ludXfpWlEXMVJ/FvxnZ/YqBtZu8rqG
	UzpjT93D6XCfpKxJAf9IEgpU=
X-Received: by 2002:a05:7301:4e0b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2c15d4125d7mr343033eec.7.1774402573473; Tue, 24 Mar 2026
 18:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323134504.575022936@linuxfoundation.org> <20260325013447.66771-1-ojeda@kernel.org>
In-Reply-To: <20260325013447.66771-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:36:00 +0100
X-Gm-Features: AQROBzCWO5qPV_1hDuoqGflZm9Y9d8dfbSYWlGNb2lHRGldE_-fw23LWI6Wqy8o
Message-ID: <CANiq72kdozG-2_VBaJyg1SZ1W9s25-=3+ER_qkYAX72avDJ9rA@mail.gmail.com>
Subject: Re: [PATCH 6.19 000/220] 6.19.10-rc1 review
To: Miguel Ojeda <ojeda@kernel.org>
Cc: gregkh@linuxfoundation.org, achill@achill.org, akpm@linux-foundation.org, 
	broonie@kernel.org, conor@kernel.org, f.fainelli@gmail.com, 
	hargar@microsoft.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, lkft-triage@lists.linaro.org, patches@kernelci.org, 
	patches@lists.linux.dev, pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, 
	sr@sladewatkins.com, stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org, Gary Guo <gary@garyguo.net>, 
	Tim Kovalenko <tim.kovalenko@proton.me>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:35=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> But 1) this is just for loongarch64, 2) Nova is still being developed
> and 3) it is just for 6.19.y, so that is probably there was no Cc:
> stable@. Anyway, Cc'ing here.

And 4) it would need backporting more bits or a custom backport.

Cheers,
Miguel
