Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A003EA67
	for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P38w+iOZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5435336ab0bso10918722a12.1
        for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 08:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700067567; x=1700672367; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ac4Ls6gftQvQgbcRf5XLhX5PwcgnIwraX4CtQN05HrE=;
        b=P38w+iOZF01RZkG/SVB2theBd06oc3hBGES3vwHBBz9vpwXQAixSdSxCI/SXnPJMGn
         plr5+ZWSQqP/91mknDeMXFebajETuGBLmTC3krnReTTMtqmNTtRjS5GzSaoRTHZ9RKd4
         oE3fFIl6Nsz/9oro+OZm6s+liYmjvjabvUe0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067567; x=1700672367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ac4Ls6gftQvQgbcRf5XLhX5PwcgnIwraX4CtQN05HrE=;
        b=BrunisoD5ye+Tk/mcJwx4BItpHroJHizIBxpp0ddiXYyrATkdWjckIc1x3IfYraQmA
         KFaR6wLFlvDzumQ41GKESmWHMcvCR9ub+e2A8nxfqj4vxJK0q1c6CeUPbzRd8mbqaiTb
         e9EIXNWnCogpw2RMiu7GruEEnTBp1dBj12qfaceoFWVb6WrPG4JhU0QZelazELoIuxwy
         9H6Y4EONZIn9Co2DO8W2W3aNXQ20QBdczwvt+z9+JToOTAzqrDMhIz43WnIPoOoX/5mE
         RGBC7mwkOf6RXJqS/lBl6j0XnXmEDpZ+/jFvvNM25GmVnZUj4Y2qCk1c4LXPXek+Y/M9
         KGBw==
X-Gm-Message-State: AOJu0YwcymiNj746vTxGYyy/aeZwzwVusDgP98X+zF7vfDL0+sGWYUeD
	gbWQnMYAdPUthF7JwVenX3P7OVfU70mLqENRYD1yd3jM
X-Google-Smtp-Source: AGHT+IEyTTsxmU73JhAkI8Q6TAeBQ9ta9G4RLH/qyYEKE+H+kjniSsRa/xa8REt2h0LlloJlvKFTyA==
X-Received: by 2002:a50:ed99:0:b0:53d:d799:641 with SMTP id h25-20020a50ed99000000b0053dd7990641mr10223556edr.26.1700067566680;
        Wed, 15 Nov 2023 08:59:26 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id dm20-20020a05640222d400b00537666d307csm6724659edb.32.2023.11.15.08.59.26
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:59:26 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40839652b97so54493105e9.3
        for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 08:59:26 -0800 (PST)
X-Received: by 2002:a19:7119:0:b0:507:9787:6773 with SMTP id
 m25-20020a197119000000b0050797876773mr9107681lfc.36.1700067545585; Wed, 15
 Nov 2023 08:59:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115154946.3933808-1-dhowells@redhat.com> <20231115154946.3933808-6-dhowells@redhat.com>
 <CAHk-=wgHciqm3iaq6hhtP64+Zsca6Y6z5UfzHzjfhUhA=jP0zA@mail.gmail.com> <3936726.1700066370@warthog.procyon.org.uk>
In-Reply-To: <3936726.1700066370@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 11:58:48 -0500
X-Gmail-Original-Message-ID: <CAHk-=whEj_+oP0mwNr7eArnOzWf_380-+-6LD9RtQXVs29fYJQ@mail.gmail.com>
Message-ID: <CAHk-=whEj_+oP0mwNr7eArnOzWf_380-+-6LD9RtQXVs29fYJQ@mail.gmail.com>
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

On Wed, 15 Nov 2023 at 11:39, David Howells <dhowells@redhat.com> wrote:
>
> I was trying to make it possible to do these tests before starting userspace
> as there's a good chance that if the UBUF/IOVEC iterators don't work right
> then your system can't be booted.

Oh, I don't think that any unit test should bother to check for that
kind of catastrophic case.

If something is so broken that the kernel doesn't boot properly even
into some basic test infrastructure, then bisection will trivially
find where that breakage was introduced.

And if it's something as core as the iov iterators, it won't even get
past the initial developer unless it's some odd build system
interaction.

So extreme cases aren't even worth checking for. What's worth testing
is "the system boots and works, but I want to check the edge cases".

IOW, when it comes to things like user copies, it's things like
alignment, and the page fault edge cases with EFAULT in particular.
You can easily get the return value wrong for a user copy that ends up
with an unaligned fault at the end of the last mapped page. Everything
normal will still work fine, because nobody does something that odd.

But those are best handled as user mode tests.

           Linus
