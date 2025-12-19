Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE824A02
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 00:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102630; cv=none; b=RQ73Ko1sF0Tak7+iZL8GuJk0hWo2dCCmeSFvjeYrKrx/giI25TFqLdQPNmdSvwcvJcttTaQu4r6PfqyqCaUK03XdMG5o0tPAEooZFqcKR+QdJth6rD//MqDX46MnpTgxXS+EDgzJLteQyKdTyHeYShmLRurNNGhCde0cGiraZTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102630; c=relaxed/simple;
	bh=2zZDW2tXIXZu35uM2VMNN82yWsoxwxKD82TIHV4Rldg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuJAH8Wt5PZ7lvefjFQ1PlOi3WnmuL8W+IhmbuHo7vgua71MmmIz1hxmsjYf197ZtioNvKWgFpXMst9ob1WgRNKVW6q0tfC4bF7CrGweAshVBVT0TIp6E/VAvAwZigfG9rpccZ1AwNUm6MYqTk8B7P+KiXJVmfXqUk7tHvlkTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CdZbvM5p; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CdZbvM5p"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f30233d8aso16181095ad.0
        for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 16:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766102628; x=1766707428; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J1OfIMpVDk62sfqPnD60EDcy2G+mtS7t2qT60UIugPU=;
        b=CdZbvM5pGbGNU3UqG/JVO9a+VZY8x4ioOr8E5cmbdkDlP33XRKb6TeEa0uanDDH7w+
         oZMrcg+YPpnwCvb+OvefZzGuMvlx5oin88rtRyHKnCo9ASx/RZHDUReILgKzyNHU8ujO
         wFPgnuCwHzYLh/C0gsHptLMyM+Tn7X+nRtbcXLP+4uGqS0FDoqHpvWSIWeFqZTIXUVHx
         XURA0hliExQigwgtId7vbuElJnTTSu2ykWnJBGYOVLdHwAiBhdvApL2sOqXNtg7PGNCd
         9DyKCfW6XLzwJ6VLAxFGm9R4u9YNWPupQJG2VlSEvYopkAIARLvxAN28iBHxCc0aUYQ5
         K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766102628; x=1766707428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1OfIMpVDk62sfqPnD60EDcy2G+mtS7t2qT60UIugPU=;
        b=RRNclxeM6y+ss6bL4XvjBeTAiQ63UAstxcyrsy0ZUsP6cChDGuX4bKNdUKJIzkM/sh
         Ec9TwBOvfdyboF5KxqKij4K8c2ZM5V0I9D5WT9KmJdbpEHOEQG8iOSs10XmHz3Pm5s8k
         CFR2/cxmNs82pMxFB7aMz474QA9vlLktgf+8DwN1uHPq+d8sfDEYK+xmoSzW/dl4kz/9
         NPkNz/Elrc1WCBatm6DXRisvwpcbHYemdaozM7LP6yH7H4bwNNT2nSm7VkCn0GhLMkZW
         vifC5fADlsnGJk60yRZnThm6kIGgNTKs+HaKdLxOkNuGne1lRY5zJDQYaj/KjeaAtLh3
         CmQw==
X-Forwarded-Encrypted: i=1; AJvYcCXrqwQIU0STD5dhEvjDFmdZk6ucHXmdBAp4CYPhZJFKnMuQPDVDXxQ/OhrIu32rHcOQc+n6qrMwlLM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy4eeM/HyYweTfT9oM9DhytfkBTwe5M1o25WsWW/72YH4nke+L
	waTOG9uWMzj3uIeTC5tIXch8i0lZIc8E6JK3ZpE3NmUpq+SmGP7hQeNjBmwiydLNY91/+Iloyci
	hvQU4nQ5G7mf170oC4KNSTxAWe01hjb18Hxi6pFbd
X-Gm-Gg: AY/fxX4dPv5xJ0Bt3IPpT38gQHfZ0vCamwPPxcz2oMupzTSG6DTvmrJHz1og1ud/iYq
	wG5J7obrRFyQfUXdv8eXNmH6gHMGqGqxgxnGQQ581YsKuAoAkrl8kfx4gSmcoj8l8NKJlSjf/m+
	TALBZQ5t4Z8sPtwQtKCbEtTFOBOe/felwZNjAydgXEppe9cwfl8ZwxcnUXxURqjCBGZrPNzjuk4
	pXogGlpl72XtKsM01CjeYfAgOQg+gPsKVWCbYsaFRNr+Ef+EnPkIOuZCdNoBQgrYVKxXfLnp5Of
	6POAa/5KSELR7oy1nGd7swcq7mw=
X-Google-Smtp-Source: AGHT+IFO8edNObswh3g/cWBIHqoDV1kxgvRHStv3yHScBSQstJAUv8VeYX2OBsNr/qdV1agwyLKHNocDDaFcF+jZhDk=
X-Received: by 2002:a05:7022:7e04:b0:11b:b882:3ed5 with SMTP id
 a92af1059eb24-121722eb273mr1139356c88.37.1766102627520; Thu, 18 Dec 2025
 16:03:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218015849.1414609-1-yuanlinyu@honor.com> <20251218015849.1414609-4-yuanlinyu@honor.com>
 <20251218155821.92454cbb7117c27c1b914ce0@linux-foundation.org>
In-Reply-To: <20251218155821.92454cbb7117c27c1b914ce0@linux-foundation.org>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 01:03:11 +0100
X-Gm-Features: AQt7F2qIdd3MXH1-hSjhv0OOTjwhSC0HJne1GRIX5sYTttEXnEWfzHwYmrFE2mE
Message-ID: <CANpmjNP1tMwdOUTNEqqTmWR2Ki8yDQ+H13iSHxzLkomj-WComQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kfence: allow change number of object by early parameter
To: Andrew Morton <akpm@linux-foundation.org>
Cc: yuan linyu <yuanlinyu@honor.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 00:58, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 18 Dec 2025 09:58:49 +0800 yuan linyu <yuanlinyu@honor.com> wrote:
>
> > when want to change the kfence pool size, currently it is not easy and
> > need to compile kernel.
> >
> > Add an early boot parameter kfence.num_objects to allow change kfence
> > objects number and allow increate total pool to provide high failure
> > rate.
> >
> > ...
> >
> >  include/linux/kfence.h  |   5 +-
> >  mm/kfence/core.c        | 122 +++++++++++++++++++++++++++++-----------
> >  mm/kfence/kfence.h      |   4 +-
> >  mm/kfence/kfence_test.c |   2 +-
>
> Can you please add some documentation in Documentation/dev-tools/kfence.rst?
>
> Also, this should be described in
> Documentation/admin-guide/kernel-parameters.txt.  That file doesn't
> mention kfence at all, which might be an oversight.
>
> Meanwhile, I'll queue these patches in mm.git's mm-nonmm-unstable
> branch for some testing.  I'll await reviewer input before proceeding
> further.  Thanks.

Note, there was an v2 sent 5 hours after this v1, which I had
commented on here:
https://lore.kernel.org/all/aUPB18Xeh1BhF9GS@elver.google.com/

Thanks,
-- Marco
