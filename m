Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876C22D7B5
	for <loongarch@lists.linux.dev>; Sun, 19 Oct 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861464; cv=none; b=RmkbEMVBoFs4Y5Q6Nrn1ec3MH/u5ao1gfXiXSnOfTMItXvRPifTTgDl5he1yNrxgzn4wmHfkXLoMoPxGadL6UVrjfrWABbpfLYpToy9WxmuLhCGVeWUcQtQ1kyR6sOBNVLVwZMc3qlb0w79mBw6+KgPYHbeLHji35ida2akxDGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861464; c=relaxed/simple;
	bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJm9VnC0K0rJxXUkvx8veGGyn3W+wTE3l2gYqtGQ0ybm5JBtQbPjtaxH2B/JFfQEDDu6QEfJH6PkSlTZUO1V4BVwtWPhfnZ/+z/IFwiwVX9ouZCjKmQwOSC2BN1plExZLpluZYWKVNfULnx3jTYP8z7+1G79BdzeLfsDwqPbNvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXv83L7T; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXv83L7T"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63e1e1bf882so1914796d50.1
        for <loongarch@lists.linux.dev>; Sun, 19 Oct 2025 01:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861461; x=1761466261; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=BXv83L7Tvzu94tARg2Nt8PHjJIzDbl5cBtia5B2t6mDz0GiASQD1FS/vA4BNL4OKpE
         Oxiwcghc8sn8owwmcCZBvqCi09tV0lWct9FYizCwhdjkOeeNp9mKTjJRFjA4YKeAezbY
         DBu6K9YLCHEc76s/eJ3whFocU+XBi8xGCe/gX9/nvsaqiQvtNGTUvEmQeULKqVXdiNhG
         uvVHy7V6swlLZG/RPTEAdZGcE4hQnKBwL55IYg5E/CLqIlrqC5MP1cj8WaRNmY53vBZH
         HVj+5Suu1mfTBphI6H+GCsycK5Rm/vJ9GZ97mh9pZaWo8RyTfoWTIt7sziUMljha/Q0l
         QEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861461; x=1761466261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=uaYCXc68YY8tIplS6FDSfhrM/9WJgiu3UyT97gbddlAXTC6ovs9rous4YAbzPwAlRw
         VmN/tveZjBdB7TUMfbif68dm30bVZ8uub11juScOIn0ZhGVEfimbD5NZAYa8JWEgwMi8
         sL7+TXEn4rkU90L/nTY6Sao4ukE9hcwc5xNyFuZYwOZWITEG9GlEYKijEFIiG3vFqH+e
         d/IyQUg1lEUYQhPo9utWIhD7UzuJJjA1OaPxeksmDYguZReUYcUqe4mH7TT82SyIhDQ7
         QmJ+/4xpLOCFsEjR3ZfwyHdFCBC3uZ9TTpJOiBkfDy2REi5mR09dVSpIDfX0ypSsFYu9
         dD6A==
X-Forwarded-Encrypted: i=1; AJvYcCUDSQE7n57BCO9HpPAgnK8S1db/tcHAFUvrkfM9QxHQTZMFiJci6YQFV26LeIMr8LJzNGkbDFFwMyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSmYor22gHKnU24cw8YMSfPw1MDP9WXDIreXqLNv5pZRBkDbC+
	4c2uiCfBSthHvE75taxk6GXQRCoZF5q2M92dQV71aBaDmx/RJDj9K6tL92oX9MQIFsvSfjAVfMI
	3A2eOcySbmb3j3cMEHVHT3T+lSBaPZnE=
X-Gm-Gg: ASbGncvgZfGH/ksgZEep5pf/j7I/xfIuDYUlpwyKkvM3h3nYEuz+rzSn2DPSzUZpCUX
	CtgIADe2pZp94ppeO4TBDqPqR1Cf/Ut490uGNvSC+SN2ZDQLJcQujCI76eTKnfg2buu4q3Xvxxz
	L+eXn1cqZdsNOApEyQMJpSi3KCjSYadzeSdyzda2jDYIJiHNNXHzJP52zDwimE2EVYgCCHLcsgH
	XD6T7iJyBwIrgkqmEILprYQB0ohcALGyOAoMEq9zOPSTjYHUBxf8AKQZN6kTSIdHT2ikpmGyKQ=
X-Google-Smtp-Source: AGHT+IEDp/usYEtVSaz10lwwm2/rh8YYcBuxag2F0nuBjSfSMoio/EijPl9t2f1PGKCDHr/mRoxnx6oC2CKJ7h3r2Ic=
X-Received: by 2002:a05:690c:31e:b0:782:9037:1491 with SMTP id
 00721157ae682-7837780ba2dmr109813007b3.42.1760861461100; Sun, 19 Oct 2025
 01:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241202010844.144356-16-ebiggers@kernel.org> <20251019060845.553414-1-safinaskar@gmail.com>
In-Reply-To: <20251019060845.553414-1-safinaskar@gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 19 Oct 2025 11:10:25 +0300
X-Gm-Features: AS18NWAhDVf2aU8hB0qWERPwO9zi-ils_dPukaoQchmqqRauvEb3B93Zz-69KFg
Message-ID: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
To: ebiggers@kernel.org
Cc: ardb@kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 9:09=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Eric Biggers <ebiggers@kernel.org>:
> > Now that the lower level __crc32c_le() library function is optimized fo=
r
>
> This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to =
lib"))
> solves actual bug I found in practice. So, please, backport it
> to stable kernels.

Oops. I just noticed that this patch removes module "libcrc32c".
And this breaks build for Debian kernel v6.12.48.
Previously I tested minimal build using "make localmodconfig".
Now I tried full build of Debian kernel using "dpkg-buildpackage".
And it failed, because some of Debian files reference "libcrc32c",
which is not available.

So, please, don't backport this patch to stable kernels.
I'm sorry.



--=20
Askar Safin
