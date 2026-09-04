Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B83BCD04
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507209; cv=pass; b=XS1qeT7MvUCKWBkgKBOJWLf44+VYG4o/jllJGook02/uJq9WSrPT9bjVNeixBrWYQVHuzSgauLVhbqkpJxxutAgLcgkW/I5wWmEwfDK/jFNDNlOC+P1tpw0ahKdzd2UqRqI7ZFTDjqMykxg0mBTAuylWzZSvp94eG+Kd72E7pRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507209; c=relaxed/simple;
	bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFXMdwTTxo3oXpP5KXe7A5ILodiG7JBhj7zg52Qn1ILvhecIHw2S719hNIxEI+VzA7AD4YGBJpPYMivu6iIXpR4QEFzUDjnCkWhLBZaGQD8gFY9AGEtLwmpmrJUkLsBCU76szfyJDuhWr6qowvEWCBnPeGAZTaV1h4GtplfJr4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnioQMNx; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnioQMNx"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39b1c184ec7so87688a91.1
        for <loongarch@lists.linux.dev>; Fri, 04 Sep 2026 00:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788507207; cv=none;
        d=google.com; s=arc-20260327;
        b=h9zME9ZwkfUKzyrf8M9C+dM5eI52Gxl5nt824c3qUF1m+iVkxfxE8HKjAyoxxvLWYG
         gRQHpnBC6wMkFAWlpRPjf9ySY023X9q6irpqpEUFK3pxYbTm1ieGpaAfxs+6OmGvtzJM
         D0ZZ8q7kuyyDaiw5B1nPH7sgqXcEPdyveL78MofZRTCcHZLiyhsl4nk4d3YkH7HPlEPu
         aOsy97LV8ewYHtTqdwRX2jduu6a7DpMwrbeEYhscCEIHx1b3f9utr+FKZE60532LQqdv
         4OlsrX+UvWIv+J+Glk+TghWfGPpEEukArsPZHQARtJXrvXLgFHVTjbaK4ps2Nx73NXyx
         zo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        fh=HLJ9OvpbSrqaiu+boXvs6rIuZefhTR9Kh4gKq4iOiSk=;
        b=rc/QvgIP4b6fVlY5oV5+PNjrizwrUFoAKHReEdOyjpsW9kRAmPLAa/ypGvibIKmJMa
         fRpa9LwlHk5xBeSgxykdsaQOm6/tlTf3m1+EXOGgkazEEKtxqIotpN6k6TYxbP1nEKJi
         +eb4CuRpe6A2FZvj5nfTHJNQ4YaFES81eahkxaT89AX3TTgwaMn9pi6y6R7oIihb9mRN
         y8zYXvzrihPpdSAkkWVJWqyBVCKLbAVzgPFaupto7zOfOyuCSAGuOzDzI3EIviTZYIOv
         ejSrCZBIyTpDKToFcJVegJZhXT3QQWHkT0VQKCVRSQHd/FicJ6FPvIwnGqc38oF9YNu+
         DlFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788507207; x=1789112007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        b=CnioQMNxepQCiZAuqjmhonNTG/ys3xvfqzLG7SAS8XLVJS14JbddUr9QZwrGqDZipb
         IYc4zh5REE3fxSuxM0b4bRphkoxLMCncugNQv17nD9br5GPj0R6AXk4sDKa8dT9KfZ+6
         t3y0r4uMi6zrIfcCcnpn5juz5PGXX5og4I9vjjfKEwQU2sgiYcHESgBhBRQPiNjtTb5M
         wsCG6qeI0H0GxblAx5vRh3m0tuP7Wn6ZOiLQ2qVN/B4moFLlQnp9nGyxt+i8ONJkGaBP
         ifPdTbDeNf5I89DEjzPijqjfs6m4yhcRfTrTk9pZ4C6FJ/kecxhCZdJusTUSFstxsuty
         2BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507207; x=1789112007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        b=pJLVKRwUW1P18NM7M71pB82Ns+nDHYU+mCtnsZlIdPEuxlccNyOAX9nx75d222o9V4
         WwiL37/poer5zQMVhR9wMvT4p+Oyi+KgtDGech99G1B3B9wjOsVT898BHBfVCnJR1gE6
         Z3aTSvqsLKC8nm6Mjx6pQvrpxStAZj3Ajm0WQkANbHqDP0jQ3kj8U75qMWouagAyexAx
         Yi/+5yMSoKoNyWcSUCJaWHEmezuvt6VMGRjtA8YjuqgYGBJnSafvniQVkzam5U5vfv+T
         VrvlgBI57AEOWIfA3S/JWmi9VlgVivxfJdGBVVOdZg+xCVvxCrytlMhJuasNasy+XK4H
         +cmA==
X-Forwarded-Encrypted: i=1; AKwUvBxku0XLqCQmNyNJKQ1piFBF8AvJjZZPuybHqcrPx5yP7H3HFjUcFagtoDKmZ+nQ5m9gPiSopQuuCRY=@lists.linux.dev
X-Gm-Message-State: AFuF++l/nMTVcJB6e+ZoWnKF1P2T5LVwcLQt5DzwIh9aco/cNHBAnDJT
	P3pD7q2udDZDJ5a+L3Yt1Wv/M6bU+MXaz314TapjGVtM0DSoYnsu4Yv/C8PeWPwEjDKS66qbEby
	fS8rjommdy7Qlzs4Y+P0tK1qC54nUrxk=
X-Gm-Gg: AYBFou0xEpF6f5VuZ4/9K7L9MBjWXNECfXfnEAP4+/x7mrqHmLEJDiByBjvh1kjRSv1
	4HNP3Mt49kPcRKP5fzmP7h+f7zX/ZcNEmUVQawTHEkZMS1V+yAQA4uAXnc7TjSsHWRFGeWqCKpA
	NpziDsbipbbCno3f3naMGsne9Ivn5dpdh2JMt9St1JV2FN/sYYa88wihY/UkPs6BwM+dlJ1a2Ez
	KF4t5shVltaVwIzEzdZoINdN1iddifBOj9Wean9i8vupmPIZkofL/e+8c6Wb0ZCAHBV7w8nUyTd
	djRp73oEmYGdceKj7B1IWoly2+nnVDHMQxLA5X7xA+2voWTbpU0AgBSBbkTzLZHtOH0HHnIXtr6
	AwH6uhC2wd2sYFYfjFmTkHaXaKfhqpUoYzohaOdX2mpe7w8m2dsW1BJKklARV
X-Received: by 2002:a17:90b:4b86:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-39b26252efemr4118157a91.4.1788507206622; Fri, 04 Sep 2026
 00:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
 <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com> <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
In-Reply-To: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 09:33:14 +0200
X-Gm-Features: AcwNN1XWy7WQ5apZIMaAZwbTUURDXMelE7BtsLngCp1nI7dZlSv2a0vAJ741AE0
Message-ID: <CANiq72nHb=bD9mtFTJk7cWgxpp0Uh2K7W4GB1ygtNEF4d3zKag@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:51=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> I queued for loongarch-fixes, thanks.

Great, thanks, please feel free to add my Acked-by:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
