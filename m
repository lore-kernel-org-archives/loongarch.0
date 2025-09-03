Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407F30AAC0
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904515; cv=none; b=Tw5Jk1sAi9tF+QLp9cG1rXqYLwz3YMC7aZ77+qnnmkCj42Y65dENQnYbJejvHIX5mHm+rNcuWRqTD0E2c+EqQH9eL7gyWx49s53KHDn7yQu6xoZp2uyp5AYJwwWKfwAuzq39UfjBKEQdqZU38tFQxkWW1gjkZdh1bszWuuW0Huw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904515; c=relaxed/simple;
	bh=XBRqaU6JjkLQfAETggfZAhadInNiJif1lTjL2TCXltQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbHzEDWPyQJWW5+i4ue/3Y41TTu0X+aS36Up0kNIgG9xNnxHPEZ8JRX1it2Mnodh7PQg8xlbF7i155Ujn70kIhz+oNZM+DzC+QfQJMyFiMR7PyixKzbhwrD/NS1X+ChXSp8mdwYpoxgfV4vcs+XwLOvvJh20VH3rBw6LP4d09Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irN0NEzk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irN0NEzk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b9853e630so17182355e9.0
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756904512; x=1757509312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
        b=irN0NEzkMpeE7vI2tqiGrNtUm+hDaP14fQaVSuFFUo8fuOCiBkcG209/KIG/S2OSBS
         9bZdQ6BRnawLWVxUeqggwHBu+E4jNM71S08p4/yB/zJDQgGfncJr888UZcxYt1UMHtxi
         3crdRhYyuCMvCyByugVnEl9KlFV/r+9Te5FxDkVSxvt50a915QSsPulHheIPTF8qyu0b
         AdWmgMBqoYyLavgcTPg4rT9V5J7dmC2gQrFW9OkGbADHVdZ9T0yWVVFQf4p6nao6Ts9d
         6c1hoi06BAqg6cR1tH7qgdsU2BcA/L1IXz+4PQvbqTK73Gv7SwvQijf5NC27VpiMzcZu
         OJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904512; x=1757509312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
        b=XCCfJlgv3vVKYb4+IUPnLVcYwHRp1EaJMmL57MfNfqpfvyDfK8fCvCfyNzUqLsUv4F
         MFJYaJFPnSFFz8f4u6xLXoDqsV6AE1PndSq33oOMkEErhITvJ4N2Kv+g7/Qe/KR8B950
         Os2H2qrzrP4yzAWj/TY2CN3Ih/Wn+Gy4dEUYUa+xf0/S4ON8PZLBceN5E/3kiLn5tejk
         numi3tdCGxR1taTarICnJExtipQsCfBA3QVYX6uc/ljEHb92l2OkDWcG3QWEUePWEuzu
         xc0/E0LqryMPSgrBISuo8vLuCKQT8iqvR56GamLjacx0XfrN9/JQzFSMRFHr5QFTQVwR
         K7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXY9NLrZwnoAmHSgNTXliO5WRb/tMNz6B6TlAWdZyh9I8/WGAR20gGJOiGIdaiM2MkTQdtzisXd48s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+tMi5LDsv0jAXR9LCQnTBIP4iTmPLfQmCABovSl86QuPHI4WH
	RwJCoaeZOsduVMtTlwReYQRZhke2U4sDj2avWTD4/TTPVmMNeSt+8F7jwBcJoBopk9OGYp9QlqU
	FAuYPP4njfD1HrCH212hSBJqbAhq6I5U=
X-Gm-Gg: ASbGncvbVkj+XbqKT+Apet5AXKl7V0tO174O/OzP8YAHvCV5Q7bra+TAABuWZE4OFkR
	nxSg9KAq047RQW/zRUg3r/GrI6DFb+YfByCXpzq2FO91MOPkHV/h6si2oB+prjBzObeOzHTuUah
	jbnPfX3DMmjSuLxXgulTsyDW6ayxCqIdX3EnOEl1QJjW0M1eXumhn2U3WFtYrcIanMRzqzEobpP
	OJcQ0S/
X-Google-Smtp-Source: AGHT+IHaI9QHXphQW4NL4BWXS0uWqM/wJHgXqqOYeELhPBU/zEzYKTUTZN/+1NM3wCGA2AyzOKaLxaL5ucEtc3zspBA=
X-Received: by 2002:a5d:5d0a:0:b0:3dc:3b91:6231 with SMTP id
 ffacd0b85a97d-3dc3b916271mr3074458f8f.12.1756904512228; Wed, 03 Sep 2025
 06:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
In-Reply-To: <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 3 Sep 2025 15:01:40 +0200
X-Gm-Features: Ac12FXxqG38KSSLGvfY5HirQQyjqsvLS5blUVLw1nroWjuASE3O6kwm-RqaVNbQ
Message-ID: <CA+fCnZdkHATBYG4RJ8rR8MciKmeV4QGwVwoQjkhc-O_igpUBTQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 3:00=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> > +void __kasan_save_free_info(struct kmem_cache *cache, void *object);
> > +static inline void kasan_save_free_info(struct kmem_cache *cache, void=
 *object)
> > +{
> > +       if (kasan_enabled())
> > +               __kasan_save_free_info(cache, object);
> > +}
>
> What I meant with these __wrappers was that we should add them for the
> KASAN hooks that are called from non-KASAN code (i.e. for the hooks
> defined in include/linux/kasan.h). And then move all the
> kasan_enabled() checks from mm/kasan/* to where the wrappers are
> defined in include/linux/kasan.h (see kasan_unpoison_range() as an
> example).
>
> kasan_save_free_info is a KASAN internal function that should need
> such a wrapper.

... should _not_ need ...

>
> For now, to make these patches simpler, you can keep kasan_enabled()
> checks in mm/kasan/*, where they are now. Later we can move them to
> include/linux/kasan.h with a separate patch.
