Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6F468F
	for <loongarch@lists.linux.dev>; Fri,  7 Oct 2022 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4Pqcbma7I8CmezCzayfM2Dc1cTkJUS9uBKY5V7UMK0=;
	b=hEpSQDSXTmU4TXzn3CobSSa19PwZL2DdvmXD7W1YhpLFdM83G7XIg5FQUNU5hBlh6iUST6
	I2zkOmTKmDytC4KoDEEKUI78Vm0uQi7a6HXHSttIrwEJlokDRzLofkJn4+TkOX+UQ2R89M
	7jT7pmuZ0vJqy2o2Tw7r0nRx+9+7cOA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-oXCvh6akPwa29TUEQGHcqw-1; Fri, 07 Oct 2022 11:46:04 -0400
X-MC-Unique: oXCvh6akPwa29TUEQGHcqw-1
Received: by mail-wr1-f72.google.com with SMTP id s4-20020adfbc04000000b0022e03fc10a9so1567448wrg.15
        for <loongarch@lists.linux.dev>; Fri, 07 Oct 2022 08:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4Pqcbma7I8CmezCzayfM2Dc1cTkJUS9uBKY5V7UMK0=;
        b=AFdEwF91tf5TK9nwg+thZ3I6qM2umGlZUgA9+5QASbLqwt3Zkwf/jnlZ6VnPIZoutV
         +u5gzukt8lNBVGndGydEU7G3CjKAUDzpZ2znz/UvC8q40NAVD1jnHDAFy9H7hI6xJfjX
         J2nKT9oGMp27CAWIOuaPQNykKY7/n/1JT1qHsL9moSbOJP9RYPEqox5+Tm4MqF0Js5yo
         j9C+qOvcvifSH700SW8chqD8x9z1NQG3fahA3rhESgFFd+sxpNRGKt3cQTBKC9F4lCJa
         g0kd/BkaqS4HgXp91f/jAOcY894GJZC1z8S1aPqnAshfoUTi5bTnbi+UxxloNqBOItxq
         qr8A==
X-Gm-Message-State: ACrzQf2QTUdx/tCy+5tXYjXhRcBegnkoow4QOQz8SEbqhLVJAzhfAlu2
	P1Ux9T0asUJoH5yCpOkj9Mf4p39LmIgToVy9/IxY149nW31bvGRd5ykApAwKgs4z53ccJT5ONMz
	QYkZMfHCYDt6dmeRKeTCp
X-Received: by 2002:a05:600c:474c:b0:3b4:cbca:5677 with SMTP id w12-20020a05600c474c00b003b4cbca5677mr3615501wmo.76.1665157563629;
        Fri, 07 Oct 2022 08:46:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5BU2FP8ts0HH9McA8hGqt4EcEkhUio8tUw5hjcE8rRRaWGVB+HCzlKu55T50nu8VVd2MVS1w==
X-Received: by 2002:a05:600c:474c:b0:3b4:cbca:5677 with SMTP id w12-20020a05600c474c00b003b4cbca5677mr3615475wmo.76.1665157563388;
        Fri, 07 Oct 2022 08:46:03 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e38c93195sm2339428wre.34.2022.10.07.08.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:46:01 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH 3/5] smp: Add a multi-CPU variant to send_call_function_single_ipi()
Date: Fri,  7 Oct 2022 16:45:31 +0100
Message-Id: <20221007154533.1878285-3-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221007154145.1877054-1-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This simply wraps around the arch function and prepends it with a
tracepoint, bringing parity with send_call_function_single_ipi().

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 7a7a22d69972..387735180aed 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -160,6 +160,12 @@ void __init call_function_init(void)
 	smpcfd_prepare_cpu(smp_processor_id());
 }
 
+static inline void send_call_function_ipi_mask(const struct cpumask *mask)
+{
+	trace_ipi_send_cpumask(_RET_IP_, mask);
+	arch_send_call_function_ipi_mask(mask);
+}
+
 #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
 
 static DEFINE_STATIC_KEY_FALSE(csdlock_debug_enabled);
@@ -970,7 +976,7 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		if (nr_cpus == 1)
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
-			arch_send_call_function_ipi_mask(cfd->cpumask_ipi);
+			send_call_function_ipi_mask(cfd->cpumask_ipi);
 
 		cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
 	}
-- 
2.31.1

