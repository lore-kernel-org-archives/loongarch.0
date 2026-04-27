Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE0B3E8C55
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313255; cv=none; b=HCSmMThydhtCRZbm2ay/gOl7pH3Ha2ayYEX7bbgRe15WKg9E9NiQ/isfI98J6OiSUVc8Co8D4T8H2T5QgilyAa8GF6mPqtINpf7M/G3UoeF/mYq/hpk+G5W/7sjpEcJ/J4eyiJzDhabHTJNjMArIcED+Ji3EsKSjvJWZWfdNvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313255; c=relaxed/simple;
	bh=LJB/6F8gRS18jiwpo8qTgtmT08hQ2iYqeOWrm4IbRjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AZRuVVgZal9hcMwttr8kqza1aM9JZcoRgw7w1iQYfZBmSZ5c4OGseCM8lRSdoLMaMJ/0WBAAUc6o954g04tkds7eCKdcD2t4XuVO4k26l7o9sBYAzUCc7q55XP7Zkhvr98NpD0qimuqpUXyv+u7tzrek3d/jK81T3oexk42LYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ecgiAdBE; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ecgiAdBE"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d780757eeso6990922f8f.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777313250; x=1777918050; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=ecgiAdBEj8O0ohLuDtRQNy1b1M/osw9dFru5e0itODJbI62UrYiyNERjIlWYw5Vusu
         ocE7995c/7GNW/CKaJ5cVf9BHcustPHdgEf5ZHAXgdmUdHtfFReNNAo7qFI5N0gcRBtq
         e7Trcn/bvNv/eEsMQQBk7pfHfMFvesG+b0HepbRCZqQXqrZ4NA+Z4dbXKO7Zo7/neEhc
         qgqMa/Vu19sjM/mU5pvPNMIrsOHQY6p8ZnuJLyglii9r7yQdZx0eFNIBlWTDtn4Tsosa
         LFJiaSo3F2Fg0inLBbIGSa6Pqje+NJZiB9kMrrYgo8sBwZjQ0oPnWQ3a9C2JVspbrOUf
         pgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313250; x=1777918050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=G/sqiRnNhy3Hg+M6U4mTRIXiHj8utJ8ld4p8O8tET5BYlwwH1S80ZS3Wko37tsde+M
         B6mmcX65zf3mxc5LNRwlCIh+5xijJOaAEozbCqHegaGL+1bs9m+WhvdshsEZj7FqTE/W
         keyE7tAhxQ9HeYpd18s6kCL66EsKOPpgotsi6JwOszlvqibHn0V3H4/+4qh4nH7Y4k44
         OXeFGmxMDddEtt5pNr6tGoeg9lDQU9qAUteQS8OHRBKWzMnJs3L96irpFnz0MhLjvDzP
         P9N0M98ulJutm8sGeQQiP3nitfidLJyUmY/0HtvYo62QRqaBU7shMVTCNlibuooe0yTO
         /ZKg==
X-Forwarded-Encrypted: i=1; AFNElJ8NRHhqx+Czs0ZSOLIC4ETU5wK0TS69Kar1Y3rs6mtbkW1eO17BrJXjDXGH0CURwKWW8+jlA6amb4U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOKxN6C9deguqEvcqd9ErR7rVablvXK9/7yx5ubrZi1cEmHxKQ
	bxUHh3j8IiV6VEOauLFh92BhP9ezK+4UvoWuac3g8EKE4UORWZDwuwnaohzlxNYITmzQth4oV5A
	b++HXv19zHQbsBJqyYA==
X-Received: from wrmd3.prod.google.com ([2002:adf:e883:0:b0:43d:7940:a11b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c7:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44636a393e7mr256856f8f.24.1777313249648;
 Mon, 27 Apr 2026 11:07:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:07:28 +0000
In-Reply-To: <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Message-ID: <ae-l4FGDPLwBuDXM@google.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
From: Alice Ryhl <aliceryhl@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 27, 2026 at 07:13:46PM +0200, Christophe Leroy (CS GROUP) wrote:
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index 01de4fbbcc84..710e07cd60ae 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -5,13 +5,13 @@
>  __rust_helper unsigned long
>  rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return copy_from_user(to, from, n);
> +	return copy_from_user_partial(to, from, n);
>  }
>  
>  __rust_helper unsigned long
>  rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return copy_to_user(to, from, n);
> +	return copy_to_user_partial(to, from, n);
>  }

No Rust code uses the return value for anything other than comparing it
with zero, so you can keep these as copy_[from|to]_user() without
issues.

Thanks, Alice
