Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699021FE468
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674724; cv=none; b=se0OQCT7RJvcjON9mwUNlE0/x+Rl9utqR7sx/6S7g/g+UD6dAiyS2VpTJVWr26P8uZwjKQ0KNouCJUeX6amrhW9kgz7A1iqBvj9pPkUZSS8jqHRbqhNiA60G98kwvjxuDHw7lB5hBnN+qPu5LXTHHz+5BRGnNw5Y3+NlHHDlBiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674724; c=relaxed/simple;
	bh=6t4kMAuA/MCcoGOtSadiO2lwzqA0u+DRxYR067NVouw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jyOPf1VNf+qShLYZ8kmknWywO9z2mSOTz1ZqpX9wTVFJP5By26M9hp8zLgd6CLfIzmkmlUyvcwRTPvTnFFXm/Xpq9ODYZP9gD6lxDjCRFwNZOPeisgiw/QNMyY66U+ppW1ivv5OwL8TGeDcueU+ccIsXjueTf3ICmAp9amCcKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FByl/5Ip; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FByl/5Ip"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f53d271b7cso5575446d6.2
        for <loongarch@lists.linux.dev>; Wed, 07 May 2025 20:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746674721; x=1747279521; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rre5ckzThRIEX2Y4k0t9sFBd2X/5w7PaP8ifjeyp2NA=;
        b=FByl/5IpX6qYBVYMkJ4Qdj37L/gagTfIS9oelTkjyJ/f1XWOdZ8Q71FQG8ryB+Ybws
         V7AXV8rzAhfoG0UlWrGcFE+wTqF2bKzgIz9NCPVBryo31soWoZ13WkClqSVZ7CcEGnGx
         mSvq8EkWbg51ELI1RdpB16rsB6SYV6yGvdf9iZNueb0R+QVOnuB/8pMZ5n7+wRmEnmXn
         Iyf6+iveTkLE1qhPgPNnFjv1ClGctCUd0S73l8GezUBAjWHWFP00RrmPXBSDvwuleafI
         vY2a1cR6mY7quvzn0vbqu2mvo45OkqeQ5uebxRwBueIigZ/xqP0HCb+z2KfIfhZBdXFm
         DcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746674721; x=1747279521;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rre5ckzThRIEX2Y4k0t9sFBd2X/5w7PaP8ifjeyp2NA=;
        b=EBReS7azhPdPBTX08s1wwvdVztIZdcwUm7tb76IrDXDoy/1yLGv5EttLw36g+i2L2t
         8QBF81vtZ8jLqF7AWpQiffk/mWapA5v2Sl5EGyX+FXHyXCminTeOAZm49vhm3Qi7lDqb
         R/C2oZe7UxlXxRYKdBinkIWNijehGyjmYFGBkTewzGnFeTGF29Uy7ETYNC+X84a3DnyG
         iJAWOmD5VyBIdSNJlSvvS/orZ+uyaq+ml4orMmXh1mvzyvzbT/mA9MR5iuMu8nieJp4z
         O3ZM3O7N3+FVLpu0Vz7pqeDcACg2zJlpu+dIgzMnMgQVuKqiebvbv/3zGjX236Cwkdxs
         h/jg==
X-Gm-Message-State: AOJu0YwcNZjQIFJPFayWAklFoAFljFmCpMLoU7TAzBJkUqfcYFxUG3Sn
	bxIqMj6iQmoMQIbQcekqZuMR+Qz2GzJCORjBXwkxgJxDIsKHm4nQopxUorWkyD9xDd3d0FKc1nd
	Hve0sUg9QHdaoXx1x+R7yTu8JbQIxtIm5
X-Gm-Gg: ASbGncumilDKsVTtexTBGfh2kP10GmW1882gdWkcQ++K2RYwamA8BErtCSG0f3qlJDo
	dL381DC9/0puLIa+JJIT57bT2Hmk1NEnCyT+v1l9+o97wQ25JiWvUsbVwc6CmMLCplHO8m6+F77
	e0bHolCTurk1MQVV7rZnGn4mM=
X-Google-Smtp-Source: AGHT+IH+mo3lnzE6vHFEbICaA1ZQ9eEZETqSaseFYe/4znFEYHF0h/oFiminTeG4ToO9k3kImsVhtm6Z2anFNIm0oH8=
X-Received: by 2002:a05:6214:d8b:b0:6f2:a537:f472 with SMTP id
 6a1803df08f44-6f542aa9d12mr94128666d6.34.1746674721206; Wed, 07 May 2025
 20:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2wo3KidH9yrGSNsV522BSkUJyn2TUp==tSv62937xPDMw@mail.gmail.com>
In-Reply-To: <CAK3+h2wo3KidH9yrGSNsV522BSkUJyn2TUp==tSv62937xPDMw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 7 May 2025 20:25:10 -0700
X-Gm-Features: ATxdqUGqDQ8r2J-EpbAHlet-DJ-9kAiLh1WzdKqgqOGi723PvAzjlbckwDPd8io
Message-ID: <CAK3+h2xKaFHTq=Hi6Fdf28aBT2tB-hw4Xc0zt+670CPThw_d+w@mail.gmail.com>
Subject: Re: [QUESTION] Loongarch bpf selftest liburandom_read.so build error
To: loongarch@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 2:30=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> Hi,
>
> I tried to build kernel 6.15-rc5 bpf selftests on Loongarch machine
> running Fedora, the bpf test programs seems built ok, but I got
> liburandom_read.so build error below:
>
>   LIB      liburandom_read.so
>
> /usr/bin/ld: cannot find crtbeginS.o: No such file or directory
>
> /usr/bin/ld: cannot find -lstdc++: No such file or directory
>
> /usr/bin/ld: cannot find -lgcc: No such file or directory
>
> /usr/bin/ld: cannot find -lgcc_s: No such file or directory
>
> clang: error: linker command failed with exit code 1 (use -v to see invoc=
ation)
>
> make: *** [Makefile:253:
> /usr/src/linux/tools/testing/selftests/bpf/liburandom_read.so] Error 1
>
> Am I missing  gcc tools for Fedora loongarch?

I installed gcc-c++-loongarch64-linux-gnu.loongarch64, now the error
is reduced to

  LIB      liburandom_read.so

/usr/bin/ld: cannot find -lstdc++: No such file or directory

/usr/bin/ld: cannot find -lgcc_s: No such file or directory

Why is it looking for lstdc++ that seems to be c++ library while
urandom_read_lib1.c urandom_read_lib2.c are not c++ code?

$(OUTPUT)/liburandom_read.so: urandom_read_lib1.c urandom_read_lib2.c
liburandom_read.map

        $(call msg,LIB,,$@)

        $(Q)$(CLANG) $(CLANG_TARGET_ARCH) \

                     $(filter-out -static,$(CFLAGS) $(LDFLAGS)) \

                     $(filter %.c,$^) $(filter-out -static,$(LDLIBS)) \

                     -Wno-unused-command-line-argument \

                     -fuse-ld=3D$(LLD) -Wl,-znoseparate-code -Wl,--build-id=
=3Dsha1 \

                     -Wl,--version-script=3Dliburandom_read.map \

                     -fPIC -shared -o $@
