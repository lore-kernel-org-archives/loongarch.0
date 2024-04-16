Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE9F132C23;
	Tue, 16 Apr 2024 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713295502; cv=none; b=CInxUSMw1s1Q5YFYDm/fBnD7bc9n1Cse3IPvmJ8QZpX/3N8Yk9aFOqpI9GemzEq0wE9+CgtapxGhTQKzVOjr0JCPVt8CPsMKE6TSwrj+lvAzkm6okPbN/SBv4fpijMaQ1VmJ//9+Phqii8BXweorVADczPpnsKzRgw22TvuVzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713295502; c=relaxed/simple;
	bh=7ffRkoqd8Raf8fUSuuAKNPwc8vUdDnYdW+Q6ugXQYuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsN+YA1TlKH9rkug52JR8HZhFnPQwkPa4OJZ+L9QR6uMG82h+PGbqRlirJfCpvIycTwGPkDtnjp8Bmh2m9UatACAnrXx30+kIaB03ijVUt/Qy5YqUtPuMzG4rGUGM9gvn/qu0Q3G968syLiD+qDYyuBTkc5ImFa0TxW5IUV8NZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZxSa4oO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZxSa4oO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2a4b457769eso2895992a91.2;
        Tue, 16 Apr 2024 12:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713295500; x=1713900300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ffRkoqd8Raf8fUSuuAKNPwc8vUdDnYdW+Q6ugXQYuM=;
        b=HZxSa4oOR4vcRudhdaWXhhRzVf5ctF9uPD2O73/ON4hI94arsPMMitnJoXjcig+BjI
         Eb6sRFginhtLJ9fE/qeyf18Vzcj8r+ObdyJSZeDknWvVh0XrTQGHgV5dbUZEUVV/H2S5
         upiD6lG/wGcXPWMkNMecjf/IUtbuQ+jxgx7jgGsIZAafnRVYhGISVPk6RVpmHWu+qagh
         k2JjVqw3Za8tKVFD41ZnELB5ysuzU8NwXeaxVcNecW0Y5WLmVzG36mQN9URmWuTI3s0W
         JDRLzPK1E//pLG4eoQbWOmd5vrw3HNgKqahSkh3YZXpiCJdQa4r2LfZgP4YP52yU9t81
         be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713295500; x=1713900300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ffRkoqd8Raf8fUSuuAKNPwc8vUdDnYdW+Q6ugXQYuM=;
        b=HyjjmnYSSN/4aJ7HKKO0hRd4QCzeh+e8H5u/8PS+Cn/V0hBjIUd9M+dxHFuz09gInA
         U1yzjI5c2zgPFdNWT1pWN5IcZY1eg8vpVqqTYhCkDO8VA9J4k5o3cH5sw2J2Z7bkqGNk
         JkmTc7z4pB3s7IsGOJAHXWH7gc0vm8pOfCxO1PZ5hadZN/FJpnhLUU4rkV5zh8dBVmiY
         LsUuOJqrCvnKvL5ICnMO43xBACHWUkD02tfFcY8zUJTTgrhYdoFdTuNM11DOg8PDYHnq
         sjJRnQzME51zGXhT6JC2G/jUXFSsBkjXrw6MO9E3F/jZHAJIsSb5HZkHKAkJS/SDlMNO
         f6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgRtPne3vyAE8rnqxGgcBEFu9KweeNCay4gVFKnt1QK0efrJiGNLJ/c73cJcVPhXYgbbcMXbXVpli/byMbmwF3C1MaQWBTTX+GmRyLhntW1EEJM+nPhRumgraW9//9Uw==
X-Gm-Message-State: AOJu0Yyb6XKAuukDv18KclAmeBC2uT7abEhvk+EwZ+jtlTUQsdQaqZ0A
	PbyuawLRhq215xkocNzREZ6BjhExCj+NPknPmokz0ZXhMzxujubKLhzTp8q/soctM6uuNHRmA9g
	tjDVsy9dskjNe73sntA7BSR2Jz+4=
X-Google-Smtp-Source: AGHT+IEacr+WK0M3ZF4z2ZTYY1pegpjK4L93Kit6rRktM90mWV0eYXk2xPvWNjCZQ+q0OF2du9cQzMc/KnT2IjI0uzI=
X-Received: by 2002:a17:90b:4b4e:b0:29c:582d:bade with SMTP id
 mi14-20020a17090b4b4e00b0029c582dbademr11298028pjb.2.1713295500304; Tue, 16
 Apr 2024 12:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416144926.599101-1-david@redhat.com>
In-Reply-To: <20240416144926.599101-1-david@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Apr 2024 21:24:01 +0200
Message-ID: <CANiq72kACt+FfeYXJxfQpmGH=uPqkDA0oprfnebw52VSKyn7kQ@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch/tlb: fix "error: parameter 'ptep' set but
 not used" due to __tlb_remove_tlb_entry()
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-arch@vger.kernel.org, loongarch@lists.linux.dev, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 4:49=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> With LLVM=3D1 and W=3D1 we get:

Hmm... I didn't need W=3D1 to trigger it (LLVM 18.1.2).

> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Thanks, looks good to me -- built-tested:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
