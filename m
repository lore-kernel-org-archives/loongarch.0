Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8174981AA8
	for <loongarch@lists.linux.dev>; Sat, 14 Feb 2026 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771107536; cv=pass; b=Y2HNZM956qUFdlGF83qO8PyiNjanNV7pLxCCJsBOkpVfslNn6VvqXo5r6EAJ1p/Gg97w7482o97GuUbPkZT4j413bjiIWo7uXZJvUXIm3u4Wwbcgy5vBlsBi2GjGhbbAtPtiXs7wu+clYCDsAlV0v035TCw+2b7hPG/0iSMxWpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771107536; c=relaxed/simple;
	bh=aLYUkEHd9SSbNnHq6tCKpj0y2iLuJRY+hRfDDQclMPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVx+OPVcgxhXfIu3cHNWjT5ORV20NYxtBSsRvtAk+UqAk3+QLHjtT7dX/L31bX0hjCM6wRuIjW9vRkZbak+Wb6jMqxgDdYoDnH5wzRq0YpL4dlz6expoXPY9QMsBJs7Jop48CDNPCvbMpH+gpavssYDlsJMz6vgy0UkjDkMLKEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTg20nJf; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTg20nJf"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba7eb6022eso87635eec.1
        for <loongarch@lists.linux.dev>; Sat, 14 Feb 2026 14:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771107535; cv=none;
        d=google.com; s=arc-20240605;
        b=iywztv6pud+Goz7RBjTPphvpjjeGc1JBPBd0cFh6DHmSktFvuSR7iLfxwRjyHDeJr/
         QEfmvpY8Jf6OAXVbpvo4X8IgfYurSpE+w0PibIFWJq/s8yd8/WWb77Y8BBfU5FH4+JpD
         Gk29S7E/MZ96ulJvi+d8tpF/2BJ/dX2dzBb+6xg2zl66qArEOFlSCjBQOR5W5DAHrLrJ
         0uovMas0JOPrdHPmsIf4++GFnF6jExf+iE6hsIbanjOtFjkEPdOtJBFAx3Km7Pr3qvTC
         c/8aKw8/Z/LqOkTBwUraqGnU/Whfa1kGzCqellFveAWik7ZDfAnOf/OrZP062xI47y8Y
         ix4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkTOOQAA5Rhl6wOanfGy9kxtf17omN8v4sffsu3HOTY=;
        fh=jLMPzMuOtEKt0wo1V/tVX2iDB++g4/hi9DAjWW5jgaQ=;
        b=AqwLaa/0LzUeG4xAUSk+dUYytK2B+gTJLVRFqtwuHH4Ss2tNulJSPKM0OJBxBUaj8V
         e2c1aJTZ6wCWGyMBhC+WzZcSPjeUbFCyIZ/CFjduiQd99IGZcfSeVUaQ0DICfwNaafTP
         pnnmVBaUXDXT0ZZxIDY06oc7jGoacIiXpjSoWuryOJAx3EZTlPnSkZN9L1/uHtd79p3e
         4t7HepMvGhHQ6yiS+8T2q+IkB1P2Tk1l494jtWODqHLyTqwosPocHuWo39n/hYKkKoZO
         rGiLYUw+jty6mfczD57wcPHsAltmRAAsPKLENBZKlbafvtzzktGZJpdBA++ffQgL08YN
         QMiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771107535; x=1771712335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkTOOQAA5Rhl6wOanfGy9kxtf17omN8v4sffsu3HOTY=;
        b=BTg20nJfeKS0ah1kL04RJoTosmItMFDsGZ01YfEStUp0A5L2D+xNToNd/tHdKn11z2
         G/2y0jfjtdM0kJBrY/AlkoyKPRSPWMu+WFtNfziaAo6oTePu/zZFm8CCVS426c0ufiUl
         /NsPFJDHUk+xomFyQm57ytLdNy9f8DwJyLnJtKtp4/JHQaEKEMAoOw2sXOlVb+MJKAt+
         MKrKWvcQ2uWGEdiYfWC2jCGTD5nUx/g3rfWH8C0SLwMeTxMNn4E5OZVwJ21ioef6ktDw
         gRTCB4+MacY8JMRci0blgCFQqXBtFzBsUfFLUw1PGiP75XMY+xY9Q2ms7pcr6mKBFj2f
         GXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771107535; x=1771712335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jkTOOQAA5Rhl6wOanfGy9kxtf17omN8v4sffsu3HOTY=;
        b=XGWvHEkZd9YaokK4vePC/wWqk2HrMwNmjNrvzkSULpGy50hri9Kh2d/EXgc5/a6j5o
         uI8ngxBptr6Xyei3UMtFIOE+Lk7Iq2P1WHxkpqYpgFzblZiUzEbeK6gXraprEnkIQsy9
         uMgKJuxCqv67PxskrfteYvkAdcxkOxOaWRgbZdltN5qIVZNsKexUfdTMFpMnslIk/YQJ
         EyCH0fBwwUMsUXKD6eeqELkqOjvV60bTuEuIgTjNKh58JEWqIezncPCsq1j/2Ztv8vIo
         7yi+OMyEzh+2fEbFCxXbfWCSB17+wIfGi6sdlwDz6jQgmO490HeAVg32q0GlVKjTKMwV
         maVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSGUzcyaWTy3nBbTF0GCRVLiBq5avw2UWaQV0gAHICONOczGdB927s3QVDBqPqnpMzgLWAr7Bc1pM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi9rD5NITKtQ9LlZ4DyKHLhaDOTXH2SG2DfKNNP5JopX8WEyHd
	jgqsldp01Qk85e/zhRY6/rTLsHpuPhDPOsMZs/wmEPLIc6f6nUrJ59RV2Ms+ERbGHlalaJLYfaR
	tXHmheDn9y9NeCw5PVkQ20YJIvDCbbxE=
X-Gm-Gg: AZuq6aL88ijHmG+qbSWkxODDxTTAda/q+UOKjm6Sw8xZGxJ8ZyhYVTywWtNUIa4ckEM
	bjypHeo+F2u8rmbQZxJYfmgGnyOLRDc+bmuhz6iPu4Lw8Uoad6JWB7F10/BGRh0NKX6Qu60zHtV
	JfdMeeefORzIrl76D/N3ZIAxNs++sCikg6l1DRacMiugnRNMiFxJ+3P3xA4wQSB0Bube1BFODf8
	6qvVIc8idfxAIpdtZTQG4z18itMczMxtsd3w4uq29ZGUc8uJY7mvt3rgpL8W4v4kMEL/U/Of/k+
	e7nfZ1puXyGDRC19yf+jOndXcIVzRFLWxFijjnS92t/3FmPKJJPAoocdG5k/wMY2uM/0CYbNsGo
	gy12C8P5Af+/Hh6irqklEgxOs
X-Received: by 2002:a05:7301:608b:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2baba0dc237mr1177734eec.5.1771107534544; Sat, 14 Feb 2026
 14:18:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214133337.112720-1-xry111@xry111.site>
In-Reply-To: <20260214133337.112720-1-xry111@xry111.site>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Feb 2026 23:18:42 +0100
X-Gm-Features: AaiRm516VoA-BlaE52MerAybt9vzW03a3XJ43B7kMfls6jQhlQBhFNpxDHrNq5A
Message-ID: <CANiq72naHZT+CuuMBFAoKmzTjVRZpicL+Wo9ai3QY5Rja-v1sA@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: Fix build failure if !CONFIG_COMPAT
To: Xi Ruoyao <xry111@xry111.site>
Cc: Alice Ryhl <aliceryhl@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>, loongarch@lists.linux.dev, 
	hev <r@hev.cc>, Miguel Ojeda <ojeda@kernel.org>, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Matt Gilbride <mattgilbride@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Paul Moore <paul@paul-moore.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 2:34=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/all/CANiq72mrVzqXnAV=3DHy2XBOonLHA6YQgH-c=
kZoc_h0VBvTGK8rA@mail.gmail.com/

Hmm... Wasn't this applied as:

  174e2a339bf7 ("rust_binder: Fix build failure if !CONFIG_COMPAT")

Then there was also this other thread:

  https://lore.kernel.org/rust-for-linux/20260105-redefine-compat_ptr_ioctl=
-v1-1-25edb3d91acc@google.com/

which got applied as:

  68aabb29a546 ("rust: redefine `bindings::compat_ptr_ioctl` in Rust")

Cheers,
Miguel
