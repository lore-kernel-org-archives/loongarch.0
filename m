Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B143AA4E0
	for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728470; cv=none; b=gjyiKuX72nQSa/RawOGkNgD/5A8Xj5sZ6sm17AG90+KppuYZjvB0MavwA+FJWNWxy1rZf1fXOTrfWmQUauFWRXFOVAVsCr2BWD5pWRAHgQGcRSNYMHJPVcZEfxZ8iL38hC1geH6PtD7zYXj8BGt6Hi68aIulIZ7lj1xZmwVrFmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728470; c=relaxed/simple;
	bh=+Rip0zxiBV4f6VW9V8yC+4tAp3H7GBB761i0PoOEi98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQA//CVWb0UvBF4zmOOLL9rSBwsJO0nN/CC0zMsReZ0YZ54RwF+Bc+J9H17PNEn8uqX9BxJKmjebm2LYXK1oagv9yk/Zk0vFT38ZP85LWLifcd+Uvri1TmmC/VONB1e73jWLx6JDe0T2Q7fG9zJiQwANoTKpu2iCxZ/a45zFkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KGjyFqK2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KGjyFqK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786728467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=;
	b=KGjyFqK2FsUXyVbx33uyyXM542P2RHujeIDJEH6aLwUbeaI4X2rLUJzDh7gAMz1RBqvyNv
	UW1xQvjobleCl5Ppc+SZqISZ1uOkVhtmkJmJ1HS0l5xXf2VmAetvEP47EJfw7A1YsEV4q+
	es0hHhyxPPDsAZPcCiKiRkIA7/xPEM0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-hVduAXAhNqaKMhhomRmg-g-1; Fri, 14 Aug 2026 13:27:46 -0400
X-MC-Unique: hVduAXAhNqaKMhhomRmg-g-1
X-Mimecast-MFC-AGG-ID: hVduAXAhNqaKMhhomRmg-g_1786728465
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so2666226a91.0
        for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 10:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728465; x=1787333265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=;
        b=XAIuAUfRd79Y0dzDKK7ONYGVuT9aMyWUNMJwNEk3Q5rChJDTXz8olWlG9BOqTQWVSu
         Jvm+W0yMs0d3+8js/RAx4D6lOkjTz5YmKU+UBEYLmd4RnmO901666UVTJJhPc+b55zGG
         ZuchryXdihQ/kCVB9Vtxw1rqlGkJk9OE6wmrT8UMFxTur7noc5zklg1UrXuJsch3F/b6
         wkoHTJetCZVKisPRbcqVZ2VpkBYlTRWpHxZDlzxAVg00PVoD9S4KTQiKzIxbM2NAYDqs
         ktsk5DaocJzGOsufx97OBFERrsWVqPMpxgFaKiPqBPdnmGSXpP8qVCRqY4sUQZv6TdrU
         QHGw==
X-Forwarded-Encrypted: i=1; AHgh+RqUlfMl4yJShfZFmTaaQRhz5BlYbio6S1fK0BFg+rVuVhHzJy8bbifdN77UT6gW/muHzQkT5oA5Ssc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVz7jvQJZVWwwNwhtBrLmPM+BukD5zkt1LGs+UH+52JFbOvojL
	xKvdZ3W7Acx8PKGe/a+jT7i656e/YXcLhjcQ/5L4oOQZ0LPxAh5zuiR5M8yYOqlB51H3Xo0fxJh
	G+mW8Mtm6/inboW4WMHpYa6x5KzHa3/BwphtawCt5SDeZjXf9uaycce1CU3MI7g==
X-Gm-Gg: AR+sD11qtYvkj9/kEMukYGSYE5ZQADcpRoQu+1zRUD4KNGdc1Yhg9PqgY9zuLRlDWUp
	nQN8Xbb4TdaR6921y3Fq16C/KvZVEG8BosVGcKm6WfUzFApxYHY55NVeaqdloIliF/83aGOvwoN
	SvhJoGlHVqth1FV4B5lXJfc4CZ4wzYQqdGX2CWYwlKGgwsalzk0sSV0HGGR4PLn4iF+XSOT3DTL
	prg+/Ty4k226n0Qkz00vQ4YUPiO7mUbsFlZJxwy48DgrVcI4cHAGUodSioxzwJzjXM9yG5COtyE
	NkSosYsmvZbPfSrRk7PZ4rmkfhwvQzCWTnPgxDZ3Y+rqKksyJK/g9AtMTa8rT3gvQrNwM33AwZ2
	DAkf4KypdpxNzMkNpRA==
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr9535900a91.4.1786728464562;
        Fri, 14 Aug 2026 10:27:44 -0700 (PDT)
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr9535821a91.4.1786728463979;
        Fri, 14 Aug 2026 10:27:43 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebbcbb78sm3512184a91.13.2026.08.14.10.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:27:43 -0700 (PDT)
Message-ID: <9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
Date: Fri, 14 Aug 2026 22:57:36 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <2vxzv79c23j6.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzv79c23j6.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NrSZ_jKJ_QpaqGHiOqV75zbz9oxzVvnVP40Mgo8wRfw_1786728465
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Pratyush,
On 14/08/26 7:43 pm, Pratyush Yadav wrote:
> On Thu, Aug 13 2026, Mukesh Pilaniya wrote:
> 
>> Several kexec_file_load() image probe functions return -EINVAL when
>> they do not recognize the image format.  A probe function that rejects
>> an image should return -ENOEXEC to indicate that the image is not a
>> recognized executable format.  -EINVAL implies a problem with the
>> syscall parameters, not with image recognition.
>>
>> kexec_image_probe_default() iterates through registered loaders and
>> returns the last probe's error code to the caller.  That error
>> propagates as the kexec_file_load() return value to userspace.
>> Returning -EINVAL from a probe when no loader matches is semantically
>> incorrect and misleads userspace about the nature of the failure.
>>
>> Return -ENOEXEC from all probe functions and their helpers when the
>> image format is not recognized.
> 
> Sounds fine in principle but can you please also share what the real
> problem you face is and how changing these return codes helps? These
> error codes are uAPI and while we _can_ change them as long as we don't
> break something, there should be a clear motivation for doing so.
> 
> [...]
> 
While debugging a misleading error on s390x where kexec -s reported
"syscall kexec_file_load not available" instead of the actual EINVAL
from a kernel command line that exceeded the architecture limit, we
traced the problem to the kexec-tools userspace utility treating
EINVAL the same as ENOSYS and ENOEXEC -- as a signal to silently fall
back to kexec_load().

kexec-tools supports two syscalls: kexec_file_load() and the older
kexec_load(). With -a (the default), it tries kexec_file_load()
first and falls back to kexec_load() when the syscall is not
implemented (ENOSYS) or the kernel does not have a loader for the
image format. With -s, it uses kexec_file_load() only with no
fallback.

When the kernel returns -EINVAL it means something went wrong while
loading the image, not that the syscall is missing or the image
format is unrecognized. kexec-tools should not fall back to the
older syscall in that case. However, some kernel probe functions
currently return -EINVAL when the image header does not match,
instead of returning -ENOEXEC. Keeping EINVAL in the fallback set
to accommodate these probes has the side effect of also hiding
genuine loading errors like an oversized command line.

kexec-tools should only fall back when kexec_file_load() is not
implemented or does not have a matching loader -- not when something
goes wrong during load.

The fix on the kexec-tools side is to remove EINVAL from the fallback
set, but that requires the kernel to be clean first -- probe functions
must return -ENOEXEC when they do not recognize an image format, not -EINVAL.

kexec-tools patch:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

A review of all kexec_file_ops.probe implementations found that arm64
image_probe(), riscv image_probe(), and loongarch efi_kexec_probe()
return -EINVAL where they should return -ENOEXEC. x86 bzImage64_probe()
and s390 s390_elf_probe() already use -ENOEXEC correctly.

