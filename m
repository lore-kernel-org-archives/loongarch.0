Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6E1B963
	for <loongarch@lists.linux.dev>; Wed, 25 Sep 2024 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727279816; cv=none; b=Cp5JDxqQ9i37GBQk35ECLGK3h6Yd3DdrlxlzsDlcMHqiVa1GNU9/cVPlz4T1RhcqRpCaFH5jQkNeH3WzFz/oWMx0cqkiwgrZ2/zGGZyCNAwFRTil1tTMWdgA36EIG8/jdtg8t/RKBFN3oR45pdpaoDprA+XWfhjnN7+zuH6jrvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727279816; c=relaxed/simple;
	bh=5OUE80WtU0P2alzw7pidUQvYWCHPiDGNs8PM/oEiQK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+sbFUdSSRNSyQ63+9uiNoQrt1rBYgIHpXJ+z+bHto6B36IUPcQszobjBny9mDjrvfkkih7HHW3CjU387mPnf9uWsjKupNEkdXrBKiedEb0O/fooCn6tQl5Z8TC0QolhvI2++DN+lOG7u8BQW1EbCe7PNYKdX5H4189dbMG4tkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpu0nUB5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpu0nUB5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365a9574b6so9864e87.1
        for <loongarch@lists.linux.dev>; Wed, 25 Sep 2024 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727279813; x=1727884613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OUE80WtU0P2alzw7pidUQvYWCHPiDGNs8PM/oEiQK8=;
        b=Mpu0nUB55zrPKKEVJEdTcMSThL4378iKLze9jup1zglZts2Wa/cXb5Ux3GZncbhvOY
         33zlGEteMmFo/kkABnzs8fIDL1ySn+BmpfZ6RnE2l+2rvUmO2cyl0Ai+IXCEMyPuLdu5
         thUy+DcFP0um9HqqPgPuir/S3FOf12WQIBkEOjohGR11r8iTZUOSCGma8WkJVQzFw13n
         sGDYx95Q9UwTPpVrRyVqF2nrnyp1YkkZxrWcKO4MyAkwwKD12KUtvKsK6cUusturCzHU
         mGdoBWoQ/wzZNeFMUZepkI/RUw+/cMwgWbyz4u5pFxiiRmWpLuP0+OxLTvJp1gNZZOvx
         16Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279813; x=1727884613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OUE80WtU0P2alzw7pidUQvYWCHPiDGNs8PM/oEiQK8=;
        b=W/OFwKoCF8aPobWV8fjOKckWJBlll4/qikjROaxonxK/W2wd0qynKC2TYg/YYstiFp
         azyfAQU8irKweKHqTLQRhPpFF8DZaqRDdAaPOXchuY4febslUh0+n2ExJyAxiq/QlaID
         RAyGo9KynRaPk2sNKj89XXmhNSoFZ0LLcznD8LCrC7JiV3VwQr2pceoqPai0ekqqjl2y
         O4Dii2Kp9w8VgbJccq/h+Zs1oGZV8g6SjjSiJ0P2Os3nm5E8NZKfLzi8CElVOWOtx5YE
         WSi6bp7wUjNxGzTRuzWpqkd+vHd+Dz8Cmmnn5ZzATb55w9aTvLw9ZKKl46xu5F3XMI9R
         boDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbrLo/Ni+zgA65ipcB6gHM6I5fBTzSRVEZu6DOB2AVaaV/kT50GqBqJmoQn6HLVHaSjBryStIeDKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKIqZQV91ABthkumHLDgxfGGKwbjnNT1KyMXFIrW0UHcvM/VX5
	cGSOqHXJFQb0YIy6SgWuIprTPTtmKEe2fIJPiPLdPhz21w2uoa4KaKWJ6FB/slNigW3brT7v0eP
	OBVv/LoBv5oOOKuaMdL23i7YGaIA=
X-Google-Smtp-Source: AGHT+IFdEcDsvri2q6U3WW1OBmRMf60+DtFuTxhJJuwUKPa6CEiFG2mxuppBB82HSIGEhIhVV0fcvjyRAZVHKcFLOjw=
X-Received: by 2002:a05:6512:124b:b0:52c:e10b:cb33 with SMTP id
 2adb3069b0e04-5387756630cmr2857168e87.50.1727279812232; Wed, 25 Sep 2024
 08:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625151807.620812-1-mjguzik@gmail.com> <6afb4e1e2bad540dcb4790170c42f38a95d369bb.camel@xry111.site>
In-Reply-To: <6afb4e1e2bad540dcb4790170c42f38a95d369bb.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 25 Sep 2024 17:56:40 +0200
Message-ID: <CAGudoHFrTWktBYQjrQMJbVZvWLPD3A51YsOMOJqAtpdruSkGsQ@mail.gmail.com>
Subject: Re: [PATCH v3] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: brauner@kernel.org, Miao Wang <shankerwangmiao@gmail.com>, viro@zeniv.linux.org.uk, 
	jack@suse.cz, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, axboe@kernel.dk, torvalds@linux-foundation.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 4:30=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
> There's a special case, AT_FDCWD + NULL + AT_EMPTY_PATH, still resulting
> EFAULT, while AT_FDCWD + "" + AT_EMPTY_PATH is OK (returning the stat of
> current directory).
>
> I know allowing NULL with AT_FDCWD won't produce any performance gain,
> but it seems the difference would make the document of the API more
> nasty.
>
> So is it acceptable to make the kernel "hide" this difference, i.e.
> accept AT_FDCWD + NULL + AT_EMPTY_PATH as-is AT_FDCWD + "" +
> AT_EMPTY_PATH?
>

huh, that indeed makes sense to add. kind of weird this was not sorted
out at the time, but i'm not going to pointer a finger at myself :) so
ACK from me as far as the idea goes

I presume you can do the honors? :)

--=20
Mateusz Guzik <mjguzik gmail.com>
