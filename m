Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF73174F
	for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KAMe7zWF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9c3aec5f326so205471466b.1
        for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700064774; x=1700669574; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ab4jnXj8Bjx21zU5WbouPNL4gj/h303kBNvkdQgDmY=;
        b=KAMe7zWFftBZdVi3kShiOdUzFXzrNU7QQrdHUbSLWNNDvok0rm4Mc8k3ZeEXWtJ5/l
         Cqp5OtvOI/W9ndK0MEAftqpF1bn3MCrghgFXv7JSy+fUUfDHm9hNnBcrg1gQJmdF73MI
         wgafY6AuuCsWPRclHdGJykmWUB2hj8yWo691A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700064774; x=1700669574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ab4jnXj8Bjx21zU5WbouPNL4gj/h303kBNvkdQgDmY=;
        b=KEf4Y8XABnF72KvpXP+Ek5Z7sSH530+rTI0gL1NThtIY4cz/Nb2DwnomG+o9pbBAU7
         dKgytRX1d1oN5GYvhMoUOoLqjQDbtryEDpSlQQ40MZ1cn8bOBPwYAoLjtD9C5IAg+WCH
         3wslg1zrbB54ZSJ5s9UXBbNgX1k7XgwMRFMT79E7WYLwSUJ6HrcZPnBDbdgFhKVr7RVH
         qffG31NZINqKJPPh3g5AUj1gkgp6/aymFFs/oX2bFm8/kSyFEnqCyobRXtP181HIJ9Zm
         826jfxJ9Rmog62VL2D8mPhz13Fs7wSiPzgzVW4Jl0VqhdbEuBBfHxYQnQoE7+05kIQV4
         kdQg==
X-Gm-Message-State: AOJu0Yz79t5tD5PegJNOLbkM26SpghQPgZfxip11pFJhEqrJIliBDwGt
	lASvoCuE7Carq/hdH2Mbx4YcGc+pjHBt7UKVplohPR5Q
X-Google-Smtp-Source: AGHT+IHiFiaPtfIX1brxVPDTiJKzaQtxLKIKnBTs53n1h+5G6UH21uq0BfUWtjwECc5j/IhmiM0d5Q==
X-Received: by 2002:a17:906:3518:b0:9f4:53d9:2d66 with SMTP id r24-20020a170906351800b009f453d92d66mr759343eja.5.1700064774755;
        Wed, 15 Nov 2023 08:12:54 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id lx20-20020a170906af1400b009e5f5efac10sm7174636ejb.208.2023.11.15.08.12.54
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:12:54 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9c603e2354fso207475266b.1
        for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 08:12:54 -0800 (PST)
X-Received: by 2002:aa7:da07:0:b0:542:ff1b:6c7a with SMTP id
 r7-20020aa7da07000000b00542ff1b6c7amr5958727eds.9.1700064753769; Wed, 15 Nov
 2023 08:12:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115154946.3933808-1-dhowells@redhat.com> <20231115154946.3933808-6-dhowells@redhat.com>
In-Reply-To: <20231115154946.3933808-6-dhowells@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 11:12:17 -0500
X-Gmail-Original-Message-ID: <CAHk-=wgHciqm3iaq6hhtP64+Zsca6Y6z5UfzHzjfhUhA=jP0zA@mail.gmail.com>
Message-ID: <CAHk-=wgHciqm3iaq6hhtP64+Zsca6Y6z5UfzHzjfhUhA=jP0zA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] iov_iter: Create a function to prepare userspace
 VM for UBUF/IOVEC tests
To: David Howells <dhowells@redhat.com>
Cc: Christian Brauner <christian@brauner.io>, Jens Axboe <axboe@kernel.dk>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, 
	David Laight <David.Laight@aculab.com>, Matthew Wilcox <willy@infradead.org>, 
	Brendan Higgins <brendanhiggins@google.com>, David Gow <davidgow@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, loongarch@lists.linux.dev, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 10:50, David Howells <dhowells@redhat.com> wrote:
>
> This requires access to otherwise unexported core symbols: mm_alloc(),
> vm_area_alloc(), insert_vm_struct() arch_pick_mmap_layout() and
> anon_inode_getfile_secure(), which I've exported _GPL.
>
> [?] Would it be better if this were done in core and not in a module?

I'm not going to take this, even if it were to be sent to me through Christian.

I think the exports really show that this shouldn't be done. And yes,
doing it in core would avoid the exports, but would be even worse.

Those functions exist for setting up user space. You should be doing
this in user space.

I'm getting really fed up with the problems that ther KUnit tests
cause. We have a long history of self-inflicted pain due to "unit
testing", where it has caused stupid problems like just overflowing
the kernel stack etc.

This needs to stop. And this is where I'm putting my foot down. No
more KUnit tests that make up interfaces - or use interfaces - that
they have absolutely no place using.

From a quick look, what you were doing was checking that the patterns
you set up in user space came through ok. Dammit, what's wrong with
just using read()/write() on a pipe, or splice, or whatever. It will
test exactly the same iov_iter thing.

Kernel code should do things that can *only* be done in the kernel.
This is not it.

              Linus
