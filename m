Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606A3176E1
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412998; cv=none; b=mF/ohIzlax1EigCpUH+hgBU3qsAdfP3Ly84tGY26wGNW9lnf0asreQfddu3ssRHOuGtlca7CqPe1ZKUjhHU0qcrG2w6wlBm/L9UvfXBiwN5NIYkiSYOIw6URYnXxiLWXQkDL14At/78pz9/JxRh+gkGmpe3v98wQhaqRUJ1nsgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412998; c=relaxed/simple;
	bh=BA//Cphq5edMK4Qw1gaH2KdEhbSdge9EaLUpTsUxTOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcHuHFgAkaBvy/TtoOYyOheeI4RsNehFZYQRqDNuw10aRXBEIdS1DN9kKQCjXuiMxsoAKVz8H3REMMaxwhW+Ib1HyeHbZsZinW9+7cY56Ul/LMn7hidi1a3xulH3LDuTEEyUNMdCW9N7ihbbrHbZwSMXHAdWBI7yij60FlQ71SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf+ATKaZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf+ATKaZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24602f6d8b6so11081625ad.1
        for <loongarch@lists.linux.dev>; Tue, 09 Sep 2025 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412996; x=1758017796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRA1tNnGH/MfGCb7e8SaVap6oHhoVBPZzEtWR1E3eD8=;
        b=Wf+ATKaZr6C1rzh3g26j8rQGh2ejpxjsvTi6d6f8fmn14FnnITPBw4mbm2iTNVx/E7
         WTSaGSG8FzGPCePWwRdo3vAsTQZQfhLmlSGLOeUy9Ij/oT2n9QmH5R2aSuCuBwDnahnE
         JQ8zVGNj7qac/uADbaLt4Ha0/HzRBCw+WYsrFqPLQSNB9lz8GC06tBnuTeTDg6rIuYdf
         DfznQvYBE/C0iDQSJjHUudqh7hjw2kGTQ2jJjdRRWfBoarNroJDGy0Mbo46tGZz1k6Ow
         N0iixKrYPGnjgCCI0XMc0ag6X4+XfmpbjntZpQ+RvT3i1s1g1ku4oWe7dZ+QeHRjJp4K
         Gb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412996; x=1758017796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRA1tNnGH/MfGCb7e8SaVap6oHhoVBPZzEtWR1E3eD8=;
        b=Q8BhLXTOyKP/oqYlw1KVgSApyLsKqw1Q5dsBUr8XZSR5gD3uD/AApnHi+YkcXTEzpq
         RYBax3pe37B10C59SLsl6FXmLplyMxDdxh+RxKQ5yhu5iLR9W9fUoZ2VTW1O5I5L28DD
         LhEZioMuwRS2c4EyeHZ+IZAC5xbeUp6xcrgJ+JPfiXGRDjG9OCFZeIzZLTCXaWgMCJKT
         QpEY/DK1JUMripYK0q8cvBRx+LvRM9p42hzEMFN3/Jo61iCdxzcgpdnSDHIUE1p5d9DX
         MP8aQQAs7L8QAC6msVWpZ939cF6cxl5HO3KP6lC7Pj6pTiGD1Z5dyLbQ97qBQ9Dcb80w
         ZXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZJKY+XBQY7RlHCrX8CpsAqobl5gbgqfGCf7+1QvhErdV5x2aqqRHjxedM6CyZBqiJJ9fBOfVgpiU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJFyAlp+XyG9m4xIOVHFOgPE+Ex4iF5wcT43RhJGqQ5kJNOLin
	UetRuuhwuZRW9zovKH+ZkZTh9rj5vhZsLtoG7gRBctJKwsq3jM/9s3Aro6KDns2Vht3KJREbO78
	2wdiVghYaTlkqhoT0+ZIIjLQXnrS2mek=
X-Gm-Gg: ASbGncsk2dy9Sccc2XmeYkC9/UhPho/oMqDbDcVWnosMncqCarmPGilfKp3tV3l75Lo
	1/MifiLGhqNzaYX9j3bj2CkKishoYDcPYKNjMT8wo8RgttVtOQPptcUTkIZszRR/7K4oiILZtDJ
	V5OM09EPAc7eQsKDSdXa29rfgUQvT6/nSHZoDC5dVEosuZjuNr4JtNZ83ufCN4Nl847Inq95Af5
	OQOxG7YhH0Kn6lNH7SdaaR/iwaUceb0NtaKrPIZOBm6LLw5sXLjPStb6nwoAbXc92xMjPnHW3lI
	JjO0Q9sYda4bG7/TF+kBr3vFlw==
X-Google-Smtp-Source: AGHT+IFRVKo/Gtkg+6TprWyzPoJr3m/eSYj6SZpUwtqQlLRttkeYnxvnIbsHYeRNu819giRbB97IRmdiE0doJRE7eVM=
X-Received: by 2002:a17:902:e845:b0:24e:a074:fbbe with SMTP id
 d9443c01a7336-251703939dbmr75623775ad.3.1757412995866; Tue, 09 Sep 2025
 03:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-3-yangtiezhu@loongson.cn>
In-Reply-To: <20250909092707.3127-3-yangtiezhu@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 12:16:22 +0200
X-Gm-Features: AS18NWBru0Kq2XMwTpEiOoCDlYbqPUJ3s50syOJN4CqxsvVJPRxFAC9ia-wum2c
Message-ID: <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Matthew Maurer <mmaurer@google.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:27=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> +config RUSTC_HAS_ANNOTATE_TABLEJUMP
> +       depends on RUST
> +       def_bool $(rustc-option,-Cllvm-args=3D--loongarch-annotate-tablej=
ump)

I am not sure if this needs the `depends on` -- from a quick test, it
seems to run regardless of it (and your `ifdef` below doesn't care
either). Cc'ing Matthew in case he remembers why the docs mention that
the Kconfig one should be guarded by `RUST_IS_AVAILABLE`.

In any case, it shouldn't hurt and it is only on the LoongArch Makefile.

If you will be taking this through the LoongArch tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks again for fixing this!

Cheers,
Miguel
