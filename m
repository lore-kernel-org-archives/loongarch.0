Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA71D88D7
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395551; cv=none; b=D5PXzyydkqU7qL7lEBGrxS5qRkY6aQ5AcgC2Ne46/3OUEQWk1wM6ExsuDGkkPVEZw3860WssQrw29QPX8pyhP0DagytWpdKIOJCEX4ZN2UHQ3pdNxRd3LUHWgqkR94PAYVO4qpuu5S4YuSXk0mtLTvBGR4/CL4GtJGL6OEy18+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395551; c=relaxed/simple;
	bh=9L42q8XTVysN7xQfFBqQBdxnATYp/dyhFwRQkVx/X5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D4BXuN5Q1sa3V/bdnhyDlCiio/nq75+ofuNiKnxYyxMf6ddFr6bOo/FR2Zn0ZyPUGQ9gdgWAXML2B0HtRjqUNiErZknApV2xeJ83AFbKIYH8Kg9SlCQS+EP7yBzWyKDNZbWOXFkR+6vO+cI+CdjH10izsWyH/6qyGIZ0+O+rpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QISF+K8F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QISF+K8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742395548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3uivH8PibG1oy7GS5DqSAMDJAw4T7tHzPmVv8sb0Gz0=;
	b=QISF+K8FcF5kU5ZTQtSdpM9evO/nePrXUATss7QHk13amPAIWJoJaf8OYXjkGg4wonCyBg
	SvqxyDme6BGG5eI8vtcoGO+9RrPjOm64bYUqIXYC85M+yvv96Hz8rlZDHdgQCvZeLGO5qy
	C4PbExb1QNCZY3Y5yw4DJgNBHl/98VU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-0qvON1JSOrah4OVWum0w-Q-1; Wed, 19 Mar 2025 10:45:46 -0400
X-MC-Unique: 0qvON1JSOrah4OVWum0w-Q-1
X-Mimecast-MFC-AGG-ID: 0qvON1JSOrah4OVWum0w-Q_1742395545
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-438da39bb69so35854125e9.0
        for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 07:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395544; x=1743000344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uivH8PibG1oy7GS5DqSAMDJAw4T7tHzPmVv8sb0Gz0=;
        b=RhKWq+pG+Bmy36gzrRJxD2rT3OPyrWv7aQe5FdnkVna6nzjmB8vDEuEDewT1NCxeZf
         hsyDmwAUPJCe1PCHh9Rfkt0jU2FIV0mq4lpg9SGcyXhC9BzOpY2CtQWQO0g2+WUtQ1Eq
         hROE3y3qTqd4FesJPF0xeiwQxFSNyr0Nnpm0JW1nNfMg7+3j3g3kLC3JH0+sK9DLE3CZ
         C5WGEHE6TQxfMsxxp9hPyuyZZGAoolaavz+xDEEfVF774Qe+Kh4aLYhnh+orIwG01VPk
         m5pUfYEFNKp2AFg1fVMaI76D2Pjx6FgXqfiwBAIb5R4CKPxTgVFviV4OwiAz1iYl22As
         yY6g==
X-Forwarded-Encrypted: i=1; AJvYcCVF7VFYMACq2g+UP7TwsCxiBm84YfvlpmM0b5KuLMufI9dX2HF3gRwExYbNaMNb6tCkwyHOkZTzVCw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy70ZPr+glXxAwIRaPc1wtPDXJ/+XE3/o4WegR2gTG9/jqNjXIV
	DvToV8qz5k+jdPv0IXuamMOcUQJfp0Ttcbaq9FkBg3iwXwQT+gk9xir71Oh7UqtwgNeXJbD8txd
	Cp5WN7yyqzP0cC/BXcS6fTXiZGkkBBhGz5Opdfv9gY3zWyMugWphHQnSy0w==
X-Gm-Gg: ASbGncsJliUVdnOQL2kIiIRKyyjAIueFMOgb4h9bCkOM7C1PnDk4LfwERFY5RF5I5LI
	mlH5hwE54dPLw9ls/NdSYA6rlaB4IkAMDgZkqHm1HjvjitcwFB6Y4s9SabZZc7JdwHXcsnXT1B9
	jljmvMgj71kymrJExYz2nXg71I0agz/YiRVF/mnQmEnRHYwgZ5qKqDLenBVFQGp1c/7SMek/NvY
	NhGIMCBgTyhRlcV0hEh/yCsCY/bskmj0EqsQQXZOLWMCe8CoDvgcdsNte8Y6NCbOqGAmAymq4XG
	EM7DK5uYVPj34dQphEApY27J/30=
X-Received: by 2002:a05:6000:1882:b0:391:45e9:face with SMTP id ffacd0b85a97d-39973b42580mr2717388f8f.54.1742395544463;
        Wed, 19 Mar 2025 07:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMTYIXhBJfy97j/7DcnGLMwHyGymMh+1VfCo0umRZJg9WuviL2+KVtrXsPj1uih+w+iQXU0g==
X-Received: by 2002:a05:6000:1882:b0:391:45e9:face with SMTP id ffacd0b85a97d-39973b42580mr2717360f8f.54.1742395543947;
        Wed, 19 Mar 2025 07:45:43 -0700 (PDT)
Received: from t14s (109-81-85-212.rct.o2.cz. [109.81.85.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f47bccsm20824965e9.15.2025.03.19.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:45:43 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:44:19 +0100
From: Jan Stancek <jstancek@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
Message-ID: <Z9rYQy3l5V5cvW7W@t14s>
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn>
 <2025031943-disparity-dash-cfa3@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2025031943-disparity-dash-cfa3@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T5T2BUrowcHm4VYSegaSvQstd8p58F_D3hqwq36Eevk_1742395545
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
>On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
>> From: Jan Stancek <jstancek@redhat.com>
>>
>> commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
>>
>> ENGINE API has been deprecated since OpenSSL version 3.0 [1].
>> Distros have started dropping support from headers and in future
>> it will likely disappear also from library.
>>
>> It has been superseded by the PROVIDER API, so use it instead
>> for OPENSSL MAJOR >= 3.
>>
>> [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
>>
>> [jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
>>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>>  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
>>  2 files changed, 138 insertions(+), 58 deletions(-)
>
>This seems to differ from what is upstream by a lot, please document
>what you changed from it and why when you resend this series again.

Hunks are arranged differently, but code appears to be identical.
When I apply the series to v6.6.83 and compare with upstream I get:

$ git range-diff HEAD~3..HEAD 558bdc45dfb2~3..558bdc45dfb2
1:  02ea9f7368c6 ! 1:  300e6d4116f9 sign-file,extract-cert: move common SSL helper functions to a header
     @@ Metadata
       ## Commit message ##
          sign-file,extract-cert: move common SSL helper functions to a header

     -    commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
     -
          Couple error handling helpers are repeated in both tools, so
          move them to a common header.

     @@ Commit message
          Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
          Reviewed-by: Neal Gompa <neal@gompa.dev>
          Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
     -    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

       ## MAINTAINERS ##
      @@ MAINTAINERS: S: Maintained
2:  0a81fb059cfd ! 2:  467d60eddf55 sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
     @@ Metadata
       ## Commit message ##
          sign-file,extract-cert: avoid using deprecated ERR_get_error_line()

     -    commit 467d60eddf55588add232feda325da7215ddaf30 upstream.
     -
          ERR_get_error_line() is deprecated since OpenSSL 3.0.

          Use ERR_peek_error_line() instead, and combine display_openssl_errors()
     @@ Commit message
          Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
          Reviewed-by: Neal Gompa <neal@gompa.dev>
          Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
     -    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

       ## certs/extract-cert.c ##
      @@ certs/extract-cert.c: int main(int argc, char **argv)
3:  0882f379a1f5 ! 3:  558bdc45dfb2 sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
     @@ Metadata
       ## Commit message ##
          sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3

     -    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
     -
          ENGINE API has been deprecated since OpenSSL version 3.0 [1].
          Distros have started dropping support from headers and in future
          it will likely disappear also from library.
     @@ Commit message
          Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
          Reviewed-by: Neal Gompa <neal@gompa.dev>
          Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
     -    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

       ## certs/extract-cert.c ##
      @@

Regards,
Jan

