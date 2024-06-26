Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F718413A
	for <loongarch@lists.linux.dev>; Wed, 26 Jun 2024 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409203; cv=none; b=EPY80zM/5GoYoChKj0jscKcrOI3eZtNCNsOLzn558gonPY8XrFmGelovkSLqtw267VyJCvYLDo0tYkCV7vux4E2YjkesggRDHaCk9F6am2qurnIRDKs7Et5EwgLRVEfnQnG7rcia8R+pQAaiOghzEAw1QBFcNEcrpd25dWaDvXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409203; c=relaxed/simple;
	bh=Gqu0PPKIwlu8QuP2Vr7fBcBkhvn7fHduxivYLrhRASU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1auwMc18h77Ayxiep+2pttP3eHH2s6leIvXgWKJgfpcqDCcYtMmrF4pgphbApu/hDcaXa+eOJNO4kV89UAltEmz32Ps6LouuBawbQW5RfZWwaXD29MGZnPI1yQiFhwMVlyiVoGfAvRXk5geMuU15umfzg8eoc/uBMie5PspgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRDjgomS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRDjgomS"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso101220061fa.1
        for <loongarch@lists.linux.dev>; Wed, 26 Jun 2024 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719409200; x=1720014000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2rgHVkzSP1+jy0s2RuB1Mh0tkpnHZ/bSgJ6vFvgRzo=;
        b=nRDjgomSF66da4PAtnbC5Tk3mJbJQ8miz4jNH8czm5tkInoIlZ6nvrpzl1jlPuU4FV
         TUotQYJdH6+G6L92g9WzQrvCCO4uizpPnfwRVcMikKOcNUHg2y0gHhbTTel2bAHdnKGn
         gpMfMMoDBzp+EiRTfuMPnAkGnN6h+vkEmtVifRIDsBJGsfqdI8m0dPJGFUrEkMckTwRe
         j6FaHPKd3zvlgpiiY3TVM7XfpaWPNvPJSvDiI2qJ4iQr28VYZqA9CVW62/4zGVPvgpZt
         zDTZXhsYJ9NVXUFWAXQOQWyz7A6JjKaKqpK1RiO54vCi1BV0D7Et01xqBcegStVw0k/N
         Oj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409200; x=1720014000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2rgHVkzSP1+jy0s2RuB1Mh0tkpnHZ/bSgJ6vFvgRzo=;
        b=C05eK+Qp312iHAs+DiwTQUr62WpzEjnTzgacifFu5Xx093Teqmu8VxrWyjMS9MI1qz
         nTHqW9uUGnRtRS7D2FVu4mWAXYYnHAalAesjT93QKWbmHY/9b2N+Lm5TQMjkuNeSgO6w
         4C29IvDgsSW8yYxeKAfH/4eXdvGhaOGvfCnE+NtQoksYvbrVVaoApPPUTZsrOlCxBH09
         P3BwXBeIwnhhVqVWxWIItQY+rZaNJtELnHDbXELK+O98BZY7qvaoCk12eFQhJ7Zts0Vw
         Sk3+k+JWmVw6qnrhtN9re2xTrcSHZEcFKT0c0+RFSXdJ/J3M2hBzjFJanQpogjSBRbjU
         pZKw==
X-Forwarded-Encrypted: i=1; AJvYcCVYQCACSo5FrzGQDmBDqHgalIpa2CvyKkmQAH0ko/xcGGL4Tlyp5JICuVrbsZuRUqZOFFET8B0g6Be13Vy+ybBHntSfiNcqQDeO
X-Gm-Message-State: AOJu0YxWfyIG7IuV7C6oDlDwVNpLAdkDjaXea27VkIbtSfY82hqFCJyn
	DtUhlSeqhBZ25meiiqkM4Y9RAq7BcH/tuiSlXUdFECvhg0DG3tB6tHMvHpYFyESJRAmuXqrNAX+
	SrgJDum1NZRLtu/0yEe+uCKxI82U=
X-Google-Smtp-Source: AGHT+IGk0pHam1HcXl3oj5p0qyRebtuWcVPso250LB/Bc8g6Hkc3v3sN/kBayKvUzph5ne4gUS0Lvblrc1cqdICkuqo=
X-Received: by 2002:a2e:7c07:0:b0:2ec:4f0c:36f9 with SMTP id
 38308e7fff4ca-2ec5b31d140mr86286441fa.36.1719409199559; Wed, 26 Jun 2024
 06:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625151807.620812-1-mjguzik@gmail.com> <0763d386dfd0d4b4a28744bac744b5e823144f0b.camel@xry111.site>
In-Reply-To: <0763d386dfd0d4b4a28744bac744b5e823144f0b.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 26 Jun 2024 15:39:47 +0200
Message-ID: <CAGudoHH4LORQUXp18s8CPPLHQMi=qG9aHsCXTp2cXuT6J9PK6A@mail.gmail.com>
Subject: Re: [PATCH v3] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, axboe@kernel.dk, torvalds@linux-foundation.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 4:59=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Tue, 2024-06-25 at 17:18 +0200, Mateusz Guzik wrote:
> > +     if ((sx->flags & (AT_EMPTY_PATH | AT_STATX_SYNC_TYPE)) =3D=3D
> > +         (AT_EMPTY_PATH | AT_STATX_SYNC_TYPE) &&
> > +         vfs_empty_path(sx->dfd, path)) {
> >               sx->filename =3D NULL;
> > -             return ret;
>
> AT_STATX_SYNC_TYPE =3D=3D AT_STATX_FORCE_SYNC | AT_STATX_DONT_SYNC but
> AT_STATX_FORCE_SYNC and AT_STATX_DONT_SYNC obviously contradicts with
> each other.  Thus valid uses of statx won't satisfy this condition.
>

I don't know wtf I was thinking, this is indeed bogus.

> And I guess the condition here should be same as the condition in
> SYSCALL_DEFINE5(statx) or am I wrong?
>

That I disagree with. The AUTOMOUNT thing is a glibc-local problem for
fstatat. Unless if you mean the if should be of similar sort modulo
the flag. :)

I am going to fix this up and write a io_uring testcase, then submit a
v4. Maybe today or tomorrow.

> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University



--=20
Mateusz Guzik <mjguzik gmail.com>
