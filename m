Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92741CA82
	for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="eJQXnfVh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337be1326e3so558656f8f.2
        for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 08:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1705423619; x=1706028419; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ogzn1QqBOwM6/wPLFbgIITGAg256qwJXlVYrohCZ+U=;
        b=eJQXnfVhN8uhT1EMHX+JXyQ38lBqjPlGfGFb/SDiGvrPhpyCouxlZcJqCBzj1/o8NV
         xvr4SczykzaqDyyEp4wNJbJl//36SLlGtHyqkbOTeyloYFpdNdrTCWOWmMElFhvkttzq
         aBKbXrdacrXc2HpRngpvLQWLDYYBp0Ohtul3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423619; x=1706028419;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ogzn1QqBOwM6/wPLFbgIITGAg256qwJXlVYrohCZ+U=;
        b=JyAXSt7m/gto35xKW0iYq3ZEon+bTomiInxOU6qTBv90LmJRwjnYvoVOoq3UMchfL3
         REDi0xwyek2hg+KmWG9O/TXxwKwfQdIlAhtZk18Wf7c4yeTAYjhdOA8GvGn73uekCPUo
         UcOt+zaECMwQFqOEZ6tWnFM1oooWWnsjiGmb7HvBf1ITQCUIwwjRljyzdXvLUYnKJN6T
         UCRKkpEZZbJY+2LGDVoUrBHTI8jxIKCUfnZue8rrtk7TDaXzTfXq41H41bURzwTEmcZR
         LKaRxb9pybrzMV2rlwCmKNOzLdOQTT57R8KAgxQtO2+2n9nkfchsge1YRSMDILgn/f5P
         wEdQ==
X-Gm-Message-State: AOJu0Yx7yvJXsfxnMA+lAWvIbKBHhGJH/ukxNB1MpA1+CA7X9w2e42x+
	8eEJ1l+6zf4CpKvGVjawoMz8bodKoXiDcw==
X-Google-Smtp-Source: AGHT+IHTwTfXe8Kw9MMMyJkn57jMIAuA/0iSLfegMtL87aQGeeTMAiAXO0QSXc2/GrfW77hv7V8JoQ==
X-Received: by 2002:adf:fcd1:0:b0:337:90e3:d66 with SMTP id f17-20020adffcd1000000b0033790e30d66mr4545484wrs.51.1705423619004;
        Tue, 16 Jan 2024 08:46:59 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id v3-20020adfedc3000000b00337bcbd0968sm1637227wro.104.2024.01.16.08.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 08:46:58 -0800 (PST)
Date: Tue, 16 Jan 2024 16:46:57 +0000
From: Chris Down <chris@chrisdown.name>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Yosry Ahmed <yosryahmed@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <ZaazAYaDMsW2Pou5@chrisdown.name>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

Vitaly Wool writes:
>> Existing users, if any, should voice their objections. Otherwise, we can
>> remove z3fold in a few releases.
>
>At this point I NACK this patch. We're about to submit an allocator
>which is clearly better that z3fold and is faster that zsmalloc in
>most cases and that submission will mark z3fold as deprecated. But for
>now this move is premature.

Why should that block completely unrelated cleanup work? Let's please not add 
dependencies between patches when there don't need to be.
