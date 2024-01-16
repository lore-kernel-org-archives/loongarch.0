Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3045879C3
	for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 04:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZTy/Sk03"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-204301f2934so6688145fac.1
        for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 20:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705379247; x=1705984047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqjuXL8OqrrC9M320WLttRPXjOmwFto71dtJpm4tHv4=;
        b=ZTy/Sk03sf+4JHmYmjD5Srv80TBR18kWkP8rgQw9pMO+djSY7Zhc8nhK9VU6dVQUqn
         ecLs8J+D/ptlCH/WIhmyAKIlkcZsuq9jnz/0brZvv/MuPi54x2JpeMGiEs2RwaRwsDm3
         DRyIgUFplSg2K2XOzdIj8OckDRWnK6oQkyZJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705379247; x=1705984047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqjuXL8OqrrC9M320WLttRPXjOmwFto71dtJpm4tHv4=;
        b=hDhKtgEg77zQuod16psPFuGS0nmO868s5wTlwhwgJiNuwLK+ZmpJQngEcGJmY7cVDD
         SRUUPqY6+PUYjNy8xRP2xuNRNybIjywRz4Ch12kVyYvZldnQ2CqExMhNnSKMTfd8WC5m
         ZN6XJyFhgvlDfpASFZ5i6qprit3IOe/5Rvg2SqngLfqV3bx+kPWYaICpU6JnT0u6ivpI
         8h5kQ6PobnB7kIFe13kIzb8OwXHxoThnSH8nw0YocJztbE24vN2OmEqLxxQaMi7JoJ2c
         z5jzv6VpLzmfJMs5lgU7xXfDvXbSArqUb/Dm6q5HyGzR6EuJcE64q5apSAUzPWaLCO3d
         KV/A==
X-Gm-Message-State: AOJu0Ywg41Oub5sytP6N3tL00Vgmyzx/U2V8Izoe+gYBjiE+OVXQ9eTS
	BzNiJWm9Y6NYdyJywrkl/A5fhIvQAzfG
X-Google-Smtp-Source: AGHT+IEKf3oZ1OyldxkJrYtd3QFGyBqZgw+BXzpyShS8QFhIlO8rlQgC9SE1dtT9pO2Z8HvTr+U7SA==
X-Received: by 2002:a05:6871:e007:b0:205:ee9e:f39f with SMTP id by7-20020a056871e00700b00205ee9ef39fmr9987896oac.6.1705379247190;
        Mon, 15 Jan 2024 20:27:27 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:e69e:52c4:fc3f:2b28])
        by smtp.gmail.com with ESMTPSA id e3-20020a636903000000b005aa800c149bsm9218065pgc.39.2024.01.15.20.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:27:26 -0800 (PST)
Date: Tue, 16 Jan 2024 13:27:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Vitaly Wool <vitaly.wool@konsulko.com>,
	Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <20240116042721.GA1983292@google.com>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
 <CAJD7tka3Ap5G7AKa=AWfTNG8rUi=Z5Fd-JD503NuRk2ycCexiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD7tka3Ap5G7AKa=AWfTNG8rUi=Z5Fd-JD503NuRk2ycCexiQ@mail.gmail.com>

On (24/01/15 08:47), Yosry Ahmed wrote:
> > At this point I NACK this patch. We're about to submit an allocator
> > which is clearly better that z3fold and is faster that zsmalloc in
> > most cases and that submission will mark z3fold as deprecated. But for
> > now this move is premature.
>
> I think unless there are current users of z3fold that cannot use
> zsmalloc, the introduction of a new allocator should be irrelevant to
> deprecating z3fold. Do you know of such users? Can you explain why
> zsmalloc is not usable for them?

I second this. I believe "do we know whether z3fold has users"
is a legit question that means no offense.
